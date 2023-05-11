pipeline {
  agent any
  
  stages {
    stage('Git Checkout') {
      steps {
        git 'https://github.com/1ch-mahavishnu/spring-petclinic-docker'
        sh  ''
      }
    }
    
    stage('Build Docker Image') {
      steps {
        sh 'ls'
        sh 'pwd'
        sh 'sudo docker build -t petclinic-app . -f Dockerfile'
      }
    }
    
    stage('Tag Docker Image and push') {
      steps {
        script {
          // def buildNumber = env.BUILD_NUMBER
          // def tag = "balamuruganelangovan/spring-petclinic-docker:${buildNumber}"
          sh "sudo docker tag spring-petclinic-docker:latest"
          // sh "echo ${tag} > IMAGE_TAG"
          sh "sudo docker login -u balamuruganelangovan -p Bala@1997"
          sh "sudo docker push balamuruganelangovan/spring-petclinic-docker"
        }
      }
    }
  }
}