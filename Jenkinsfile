pipeline {
    agent {
        docker {
            image 'maven:3.9.9-eclipse-temurin-21'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Reshufowzi/java-webapps-jenkins.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                  java -version
                  mvn -version
                  mvn clean package
                '''
            }
        }

        stage('Docker Build & Deploy') {
            steps {
                sh '''
                  docker stop java-webapp || true
                  docker rm java-webapp || true

                  docker build -t java-webapp:1.0 .
                  docker run -d -p 8081:8081 --name java-webapp java-webapp:1.0
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Java Web Application deployed successfully (Docker-based build)'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}


