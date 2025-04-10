#  base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

COPY target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar app.jar

# Exposeport
EXPOSE 8080

# Run application
ENTRYPOINT ["java", "-jar", "app.jar"]
