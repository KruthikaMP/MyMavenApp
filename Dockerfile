FROM maven:3.5.4-jdk-8-alpine as maven //base image

COPY ./pom.xml ./pom.xml   // copying all dependencies

COPY ./src ./src //copy fom source to destination

RUN mvn dependency:go-offline -B 

RUN mvn package 

FROM openjdk:8u171-jre-alpine

WORKDIR /adevguide

COPY --from=maven target/Mymavenapp.jar ./Mymavenapp.jar
EXPOSE 3000
CMD ["java", "-jar", "./Mymavenapp.jar"]
