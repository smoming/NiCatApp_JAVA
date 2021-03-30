FROM maven:3.5.2-jdk-8-alpine AS maven_build

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:8-jdk-alpine

WORKDIR /opt/
COPY --from=maven_build /build/target/NiCatApp.jar /opt/NiCatApp.jar

EXPOSE 8080
RUN sh -c 'touch NiCatApp.jar'
ENTRYPOINT ["java","-jar","NiCatApp.jar"]