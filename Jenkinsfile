     pipeline {
     agent any
     tools{
          jdk 'java 8'
          maven 'maven 3'
     }
     stages{
        stage('Cloning git'){
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/priyanka-1994/docker-build-with-jenkins-sample.git']]])
                sh 'mvn -B -DskipTests clean package'  
                }
            }    
       
        stage('Build Docker Image'){
            steps{
                 sh "docker build . -t prikale/docker-build-with-jenkins-sample:${BUILD_ID}.0.0"
             }
           }
        stage('Push Docker Image'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'DockerCredentials', variable: 'DockerHubPwd')]) {
                   sh "docker login -u prikale -p ${DockerHubPwd}"
                       }
                     sh 'docker push prikale/docker-build-with-jenkins-sample:${BUILD_ID}.0.0'
                         }
                    }
                }
        stage('Docker run Container'){
            steps{
                sh 'docker run -d -p 3000:8080 --name myjenkinsapp prikale/docker-build-with-jenkins-sample:${BUILD_ID}.0.0'
            }
        }
    }
}
