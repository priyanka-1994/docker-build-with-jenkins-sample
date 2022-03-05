      pipeline {
     agent any
     tools{
          jdk 'java 8'
          maven 'maven 3'
     }
     options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '' , artifactNumToKeepStr: '' , daysToKeepStr: '',numToKeepStr: '3')
        timeout(10)
        timestamps()
        disableConcurrentBuilds()
        skipDefaultCheckout(true)
        }
     stages{
        stage('Cloning git'){
            steps {
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/priyanka-1994/docker-build-with-jenkins-sample.git']]])
                sh 'mvn clean package'  
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
    //  stage('Docker run Container'){
    //      steps{
    //          script{
    //              def dockerRun = "docker run -d -p 3000:8080 --name myjenkinsapp prikale/docker-build-with-jenkins-sample:${BUILD_ID}.0.0"
    //              sshagent(['jenkins-creds']) {
    //                 sh "ssh -o StrictHostKeyChecking=no root@3.86.59.145 ${dockerRun}"   
    //                 }    
    //         }
    //     }
    // }
        stage ('SonarQube'){
            environment {									        
               SCANNER_HOME = tool 'Sonar-Qube-Scanner'
                 }
            steps{
                withSonarQubeEnv(installationName: 'Sonar-Qube-Scanner') {																					
                  sh "${SCANNER_HOME}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"					                  		
                   }										        
               } 			
            }     
        }
}
