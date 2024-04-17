# Use an official Node.js runtime as the base image
FROM node:latest

# Set the working directory in the Docker image
WORKDIR /app

# Copy package.json and package-lock.json into the Docker image
COPY package*.json ./

# Install the application's dependencies inside the Docker image
RUN npm install

# Copy the rest of the application's code into the Docker image
COPY . .

# Run the application
CMD ["npm", "start"]

# Make port 5000 available to the world outside the Docker image
EXPOSE 5000