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
RUN tsc

# Expose port (make sure this matches what your server uses)
EXPOSE 3001

# Start the app
CMD ["node", "dist/index.js"]
