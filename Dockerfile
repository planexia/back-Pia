# Imagen base de Java
FROM eclipse-temurin:17-jdk-jammy

# Argumento para definir la ubicación del JAR
ARG JAR_FILE=target/back2.4-1-0.0.1-SNAPSHOT.jar

# Copiar el archivo JAR al contenedor
COPY ${back2.4-1-0.0.1-SNAPSHOT.jar} app.jar

# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
