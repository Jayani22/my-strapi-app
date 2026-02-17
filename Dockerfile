FROM node:18

# Create app directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Less memory usage
ENV NODE_ENV=production

# Build Strapi admin panel
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]
