FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/java-webapp2-1.0.jar app.jar
EXPOSE 8082
CMD ["java", "-jar", "app.jar"]

