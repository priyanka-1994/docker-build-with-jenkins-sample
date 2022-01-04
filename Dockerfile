FROM openjdk
# RUN apt-get update -y; \
#    apt-get install -y 
EXPOSE 8080
# COPY target/docker-build-with-jenkins-sample.jar docker-build-with-jenkins-sample.jar
COPY target/* . jar /
ENTRYPOINT ["java","-jar","/docker-build-with-jenkins-sample.jar"]
