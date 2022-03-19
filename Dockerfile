FROM openjdk:11 AS builder
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew clean build

FROM openjdk:11
ARG JAR_FILE=./build/libs/jpashop-0.0.1-SNAPSHOT.jar
COPY --from=builder ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
