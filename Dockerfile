FROM nginx:latest AS build
WORKDIR /code
COPY . .
RUN ./mvnw package

FROM openjdk:8-jre-alpine
COPY --from=build /code/target/*.jar /code/app.jar
WORKDIR /code
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
