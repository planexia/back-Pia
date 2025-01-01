# Imagen base de Java
FROM eclipse-temurin:17-jdk-jammy

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} demo-crud-1.0.jar
ENTRYPOINT ["java","-jar","/demo-crud-1.0.jar"]