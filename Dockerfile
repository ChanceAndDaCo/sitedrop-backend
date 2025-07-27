# Use Node LTS base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
RUN npm install

# Build TypeScript
RUN npx tsc

# Expose port (use your actual port if different)
EXPOSE 3001

# Start app
CMD ["node", "dist/index.js"]
