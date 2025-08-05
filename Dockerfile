# Use Node LTS base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first for better cache
COPY package*.json ./

# Install dependencies (including typescript + prisma)
RUN npm install
RUN npm install -g typescript

# Copy everything else
COPY . .

# Generate Prisma client
RUN npx prisma generate --schema=prisma/schema.prisma

# Build the TypeScript files
# Use official Node.js LTS image
FROM node:18

# Set working directory
WORKDIR /app

# Copy only package files first (leverage Docker cache)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . .

# Generate Prisma client (before build)
RUN npx prisma generate --schema=prisma/schema.prisma

# Build TypeScript
RUN npm run build

# Expose the app port
EXPOSE 3001

# Run the app
CMD ["npm", "start"]
