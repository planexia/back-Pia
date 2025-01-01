# Imagen base de Java
FROM eclipse-temurin:17-jdk-jammy

# Argumento para definir la ubicación del JAR
ARG JAR_FILE=target/*.jar

# Copiar el archivo JAR al contenedor
COPY ${JAR_FILE} app.jar

# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
