# Etapa 1: Construcción
FROM eclipse-temurin:17-jdk-jammy AS builder

# Instala Maven directamente
RUN apt-get update && apt-get install -y maven

# Establece el directorio de trabajo
WORKDIR /app

# Copia el resto del proyecto al contenedor
COPY . .

# Compila el proyecto usando Maven
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:17-jdk-jammy

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado desde la etapa de construcción
COPY --from=builder /app/target/*.jar app.jar

# Configura el puerto predeterminado
EXPOSE 8080

# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
