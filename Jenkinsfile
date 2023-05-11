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
        sh 'docker build -t petclinic-app . -f Dockerfile'
      }
    }
    
    stage('Tag Docker Image') {
      steps {
        script {
          def buildNumber = env.BUILD_NUMBER
          def tag = "balamuruganelangovan/spring-petclinic-docker:${buildNumber}"
          sh "docker tag spring-petclinic-docker ${tag}"
          sh "echo ${tag} > IMAGE_TAG"
        }
      }
    }
    
    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
          sh "docker push $(cat IMAGE_TAG)"
        }
      }
    }
  }
}