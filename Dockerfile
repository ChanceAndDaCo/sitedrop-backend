# Use Node LTS base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first for better cache
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g typescript

# ✅ Generate Prisma Client
RUN npx prisma generate --schema=prisma/schema.prisma

# Copy the rest of the application files
COPY . .

# Build the TypeScript code
RUN tsc

# Expose the port your app runs on
EXPOSE 3001

# Start the application
CMD ["node", "dist/index.js"]
