# Use JDK 21 as the base image
FROM openjdk:21

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY ./target/helloWorld.jar /app/helloworld.jar

# Command to run the application
CMD ["java", "-jar", "/app/helloworld.jar"]
