FROM openjdk
# RUN apt-get update -y; \
#    apt-get install -y 
EXPOSE 8080
COPY target/docker-build-with-jenkins-sample.war docker-build-with-jenkins-sample.war
# COPY target/* .war /
ENTRYPOINT ["java","war","/docker-build-with-jenkins-sample.war"]
