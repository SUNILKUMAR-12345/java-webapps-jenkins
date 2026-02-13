pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Reshufowzi/java-webapps-jenkins.git'
            }
        }

        stage('Build with Maven (Docker)') {
            steps {
                sh '''
                  docker run --rm \
                    -v "$PWD":/app \
                    -w /app \
                    maven:3.9.9-eclipse-temurin-21 \
                    mvn clean package
                '''
            }
        }

        stage('Docker Build & Run') {
            steps {
                sh '''
                  docker stop java-webapp2 || true
                  docker rm java-webapp2 || true

                  docker build -t java-webapp2:1.0 .
                  docker run -d -p 8082:8082 --name java-webapp2 java-webapp2:1.0
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Java Web Application deployed successfully'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}

