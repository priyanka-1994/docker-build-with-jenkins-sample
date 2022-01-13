pipeline {
     agent any
     tools{
          jdk 'java8'
          maven 'maven3'
     }
     stages{
         stage('Cloning git'){
           steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/priyanka-1994/docker-build-with-jenkins-sample.git']]])
                }
       }
         stage('Build'){
             steps{
                dir("/root/.jenkins/workspace/jenkins-pipline") {
                sh 'mvn -B -DskipTests clean package'
                }
             }
         
        }
   }   
}
