# Imagen base de Java
FROM eclipse-temurin:17-jdk-jammy

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el JAR generado al contenedor
COPY target/*.jar app.jar

# Exponer el puerto donde la aplicación escucha (por defecto 8080)
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
