FROM eclipse-temurin:17-jdk-jammy
 
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN sudo ./mvnw dependency:resolve

COPY src ./src

CMD ["sudo ", "./mvnw", "spring-boot:run"]
