# Stage 1: Build frontend
FROM node:lts-alpine AS frontend-build
WORKDIR /frontend
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ ./
RUN npm run build

# Stage 2: Build backend JAR
FROM eclipse-temurin:25-jdk AS backend-build
WORKDIR /backend
COPY backend/.mvn ./.mvn
COPY backend/mvnw ./
RUN chmod +x ./mvnw
COPY backend/pom.xml ./
RUN ./mvnw dependency:go-offline -q
COPY backend/src ./src
COPY --from=frontend-build /frontend/dist ./src/main/resources/static
RUN ./mvnw package -DskipTests -q

# Stage 3: Runtime image (JRE only)
FROM eclipse-temurin:25-jre
WORKDIR /app
COPY --from=backend-build /backend/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
