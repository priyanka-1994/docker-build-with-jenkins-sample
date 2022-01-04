FROM openjdk:11
RUN apt-get update -y; \
    apt-get install -y 
EXPOSE 8080
COPY target/docker-build-with-jenkins-sample.jar docker-build-with-jenkins-sample.jar
ENTRYPOINT ["java","-jar","/docker-build-with-jenkins-sample.jar"]
