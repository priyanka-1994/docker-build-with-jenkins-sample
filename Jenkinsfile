pipeline {
     agent any
     tools{
          jdk 'java8'
          maven 'maven3'
     }
   //  environment{
     //    registry="prikale/docker-build-with-jenkins-sample"
       //  registryCredential ="1d35bee4-5720-4cf8-b22b-dbbbccebf5b7"
        // dockerImage=""
    // }
     
     stages{
        stage('Cloning git'){
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/priyanka-1994/docker-build-with-jenkins-sample.git']]])
                }
            }    
       stage('Build Maven'){
            steps {
                dir("/root/.jenkins/workspace/jenkins-pipline") {
                sh 'mvn -B -DskipTests clean package'
                }
             }
       }
        stage('Build Docker Image'){
            steps{
                sh "docker build . -t prikale/docker-build-with-jenkins-sample"
             }
           }
        //stage("Push Docker Image"){
        //    steps{
          //      script {
                  //  step([$class: 'DockerBuilderPublisher', cleanImages: false, cleanupWithJenkinsJobDelete: false, cloud: '', dockerFileDirectory: '', fromRegistry: [credentialsId: '1d35bee4-5720-4cf8-b22b-dbbbccebf5b7'], pushCredentialsId: '1d35bee4-5720-4cf8-b22b-dbbbccebf5b7', pushOnSuccess: true, tagsString: 'docker-build-with-jenkins-sample'])
                   // sh "docker push prikale/docker-build-with-jenkins-sample"
            //       withCredentials([string(credentialsId: 'Pipline-global-id', variable: 'docker-tag-image')]) {
              //     sh 'docker login -u prikale --password-stdin ${docker-tag-image}'
                //   }  
                 //   sh 'docker push prikale/docker-build-with-jenkins-sample'
                   
                       
                   }
                  //  docker.withRegistry('',registryCredential) {
                //    dockerImage.push()
         
}
