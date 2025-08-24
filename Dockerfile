# Use official Node.js LTS image
FROM node:18

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Copy prisma schema early so postinstall can see it
COPY prisma ./prisma

# Install dependencies (will run postinstall -> prisma generate)
RUN npm install

# Copy the rest of the app
COPY . .

# Build TS
RUN npm run build

EXPOSE 3001
CMD ["npm", "start"]

