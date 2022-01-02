FROM openjdk:8
EXPOSE 8080
ADD target/docker-build-with-jenkins-sample.jar docker-build-with-jenkins-sample.jar
ENTRYPOINT ["java","-jar","/docker-build-with-jenkins-sample.jar"]