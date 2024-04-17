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

# Make port 8080 available to the world outside the Docker image
EXPOSE 3000

FROM nginx:alpine

COPY --from=0 /app /usr/share/nginx/html

# Define the command to run the application
CMD [ "nginx", "-g", "daemon off;" ]