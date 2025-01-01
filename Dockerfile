# Etapa 1: Construcción
FROM eclipse-temurin:17-jdk-jammy AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Copia todos los archivos del proyecto al contenedor
COPY . .

# Compila el proyecto usando Maven y genera el JAR
RUN ./mvnw clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:17-jdk-jammy

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado desde la etapa de construcción
COPY --from=builder /app/target/*.jar app.jar

# Configura el puerto predeterminado para Render (8080)
EXPOSE 8080

# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
