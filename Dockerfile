# Use Node LTS base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first for better cache
COPY package*.json ./

# Install dependencies (including typescript)
RUN npm install
RUN npm install -g typescript

# Copy the rest of the files
COPY . .

# Build TypeScript
RUN tsc

# Expose port
EXPOSE 3001

# Start the app
CMD ["node", "dist/index.js"]
