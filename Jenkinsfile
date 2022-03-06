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
                 sh 'docker image build -t prikale/$JOB_NAME:v1.$BUILD_ID .'
                 sh 'docker image build tag $JOB_NAME:v1.$BUILD_ID prikale/$JOB_NAME:v1.$BUILD_ID'
                 sh 'docker image build tag $JOB_NAME:v1.$BUILD_ID prikale/$JOB_NAME:latest'
             }
           }
        stage('Push Docker Image'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'DockerCredentials', variable: 'DockerHubPwd')]) {
                   sh "docker login -u prikale -p ${DockerHubPwd}"
                   sh 'docker image push prikale/$JOB_NAME:v1.$BUILD_ID'
                   sh 'docker image push prikale/$JOB_NAME:latest'
                   sh 'docker image rm $JOB_NAME:v1.$BUILD_ID prikale/$JOB_NAME:v1.$BUILD_ID prikale/$JOB_NAME:latest'
                        }
                    }
               }
         }
       stage('Docker run Container'){
           steps{
               script{
                   def dockerRun = 'docker run -d -p 3000:80 --name myjenkinsapp prikale/JOB_NAME'
                   def docker_rmc_container = 'docker rm -f myjenkinsapp'
                   def docker_rmi = 'docker rmi -f prikale/JOB_NAME'
                   sshagent(['jenkins-creds']) {
                         
                    # if error comes /var/run/sock ,then change permissions(chmod 777) on docker server. 
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@3.86.59.145 ${docker_rmc_container}" 
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@3.86.59.145 ${docker_rmi}" 
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@3.86.59.145 ${dockerRun}" 
                      
                }    
             }
         }
     }
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
