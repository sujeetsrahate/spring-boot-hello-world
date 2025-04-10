pipeline {
    agent any
    tools {
        maven 'Maven3'  // Set in Jenkins tools
        ##jdk 'jdk17'     // Set in Jenkins tools
    }
    environment {
        scannerHome = tool 'SonarScanner'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
        stage('Docker Build & Push') {
            when {
                branch 'develop'
            }
            steps {
                sh 'docker build -t springboot-app:v1 .'
                // Optional: Push to registry
            }
        }
        stage('Kubernetes Deploy') {
            when {
                branch 'develop'
            }
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
