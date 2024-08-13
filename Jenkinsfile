pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from source control
                git branch: 'main', url: 'https://github.com/IonZmeu/jenkins-test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build('my-python-app')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                script {
                    docker.image('my-python-app').run('-d -p 9090:9090 --name my-python-app-container')
                }
            }
        }

        stage('Wait for App to Start') {
            steps {
                // Wait a few seconds to ensure the app starts
                sh 'sleep 10'
            }
        }

        stage('Test Container') {
            steps {
                // Additional steps to test or interact with the running container
                echo 'Running tests or additional checks here'
            }
        }

        stage('Clean Up') {
            steps {
                // Stop and remove the container
                script {
                    sh 'docker stop my-python-app-container || true'
                    sh 'docker rm my-python-app-container || true'
                }
            }
        }
    }

    post {
        always {
            // Clean up or notify after pipeline completion
            echo 'Pipeline completed'
        }
    }
}
