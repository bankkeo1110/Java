# Step 1: Use a base image with Maven and JDK 17 installed
FROM maven:3.8.4-openjdk-17 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy only the pom.xml file
COPY pom.xml .

# Step 4: Resolve dependencies.
# This will download all dependencies and cache them in a layer.
RUN mvn dependency:go-offline

# Step 5: Copy the project source code
COPY src ./src

# Step 6: Build the application
# Now, this will use the cached dependencies unless pom.xml has changed
RUN mvn clean package

# Step 7: Use a base image for the container that will run the application
FROM openjdk:17-jdk-slim

# Step 8: Set the deployment directory as the working directory
WORKDIR /app

# Step 9: Copy the built application from the build stage
COPY --from=build /app/target/*.jar app.jar

# Step 10: Expose the port the application runs on
EXPOSE 8080

# Step 11: Run the application
CMD ["java", "-jar", "app.jar"]
