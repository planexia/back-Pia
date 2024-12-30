# Usa una imagen base con Java
FROM openjdk:17-jdk-slim

# Definir el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo JAR generado en el directorio de trabajo
COPY target/*.jar app.jar

# Exponer el puerto en el que tu aplicación escucha (por defecto 8080 para Spring Boot)
EXPOSE 8080

# Comando para ejecutar el JAR dentro del contenedor
ENTRYPOINT ["java", "-jar", "app.jar"]
