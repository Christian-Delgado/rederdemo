# Spring Boot + Render (Docker)

Proyecto mínimo de Spring Boot listo para desplegar en [Render](https://render.com).

## Requisitos locales
- Java 21 (JDK)
- Maven 3.9+ (opcional si usas el wrapper)
- Docker (opcional para probar la imagen)

## Ejecutar localmente
```bash
mvn spring-boot:run
# o
mvn -DskipTests package && java -jar target/spring-boot-render-demo-0.0.1-SNAPSHOT.jar
```

La app escucha en `http://localhost:8080/` y expone `GET /` y `GET /actuator/health`.

## Despliegue en Render (recomendado con Dockerfile)
1. Sube este repo a GitHub/GitLab.
2. En Render, crea un **Web Service** y conecta el repo.
3. Render detectará el `Dockerfile` automáticamente. No necesitas comandos de build/start.
4. El servicio se publica en un dominio `onrender.com`.
5. Logs y health checks se ven en el panel de Render.

> Si prefieres **sin Docker**, puedes eliminar `Dockerfile` y configurar:
> - Build Command: `./mvnw -DskipTests package` (o `mvn -DskipTests package` si tienes Maven)
> - Start Command: `java -jar target/spring-boot-render-demo-0.0.1-SNAPSHOT.jar`
> Asegúrate de que `server.port=${PORT:8080}` esté en `application.properties` (ya lo está).

## Endpoints
- `GET /` → JSON de bienvenida
- `GET /actuator/health` → Health check
