# Imagen base de Java
FROM eclipse-temurin:17-jdk-jammy

ARG JAR_FILE=target/back2.4-1-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar


# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
