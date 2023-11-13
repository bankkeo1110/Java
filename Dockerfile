# Step 1: Use a base image with Maven and JDK 17 installed
FROM maven:3.8.4-openjdk-17 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the project's pom.xml and source code
COPY pom.xml .
COPY src ./src

# Step 4: Build the application using Maven
RUN mvn clean package

# Step 5: Use a base image for the container that will run the application
FROM openjdk:17-jdk-slim

# Step 6: Set the deployment directory as the working directory
WORKDIR /app

# Step 7: Copy the built application from the build stage
COPY --from=build /app/target/*.jar app.jar

# Step 8: Expose the port the application runs on
EXPOSE 8080

# Step 9: Run the application
CMD ["java", "-jar", "app.jar"]
