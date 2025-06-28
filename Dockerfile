# Étape 1 : build avec Maven
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Étape 2 : image exécutable
FROM eclipse-temurin:17
# Crée un utilisateur non-root et un groupe
RUN addgroup --system appgroup && adduser --system appuser --ingroup appgroup

# Copie le jar généré depuis l'étape de build (ajuste le chemin selon ton projet)
COPY --from=0 target/secure-pipeline-0.0.1-SNAPSHOT.jar app.jar

# Change l’utilisateur pour celui non-root
USER appuser
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
