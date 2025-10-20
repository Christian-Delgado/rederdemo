# ---- build stage ----
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /workspace
COPY pom.xml .
RUN mvn -q -e -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q -DskipTests package

# ---- run stage ----
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /workspace/target/spring-boot-render-demo-0.0.1-SNAPSHOT.jar app.jar
# Render provides $PORT; EXPOSE is informational
ENV PORT=8080
EXPOSE 8080
# Conservative JVM flags for low-memory instances
CMD ["sh", "-c", "java -XX:MaxRAMPercentage=75 -XX:InitialRAMPercentage=50 -jar app.jar"]
