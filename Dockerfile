FROM openjdk:11
WORKDIR insirance
ARG JAR_FILE=target/insure-me-1.0.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","app.jar"]
