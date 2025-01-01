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
COPY --from=builder /app/target/back2.4-1-0.0.1-SNAPSHOT.jar app.jar

# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
