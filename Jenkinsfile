pipeline {
  agent any
  
  stages {
    stage('Git Checkout') {
      steps {
        git 'https://github.com/1ch-mahavishnu/spring-petclinic-docker'
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
        withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')])
        script {
          def buildNumber = env.BUILD_NUMBER
          def tag = "balamuruganelangovan/spring-petclinic-docker:${buildNumber}"
          sh "sudo docker tag spring-petclinic-docker ${tag}"
          sh "echo ${tag} > IMAGE_TAG"
          sh "sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
          sh "sudo docker push ${tag}"
        }
      }
    }
  }
}