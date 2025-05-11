# Step 1: Use a Node.js image for building the app
FROM node:16 AS build

WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the entire application code
COPY . ./

# Step 2: Use a distroless base image for the final runtime container
FROM gcr.io/distroless/nodejs:16

# Set the working directory inside the container
WORKDIR /app

# Copy the app files from the build stage
COPY --from=build /app /app

# Expose the necessary port
EXPOSE 8089

# Start the application
CMD ["server.js"]
