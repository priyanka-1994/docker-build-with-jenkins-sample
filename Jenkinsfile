pipeline {
     agent any
     tools{
          jdk 'java8'
          maven 'maven3'
     }
     stage('code checkout') {
         git credentialsId: 'checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], gitTool: 'jgitapache', userRemoteConfigs: [[credentialsId: 'credentials-github', url: 'https://github.com/priyanka-1994/docker-build-with-jenkins-sample.git']]]) ', url:'https://github.com/priyanka-1994/docker-build-with-jenkins-sample.git'
     }
     stage('Code Quality') {
         sh "${MvnCli} compile"
         }
     stage('Junit Test') {
         sh "${MvnCli} test"
     }
     stage('Package Code') {
         sh"${MvnCli} pacakge -Dmaven.test.skip=true"
     }
     stage('Archive artifacts') {
         step {
            archiveArtifacts '**/**/*.jar'
         }
    }
}