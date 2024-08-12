pipeline {
    agent {
        docker {
            image 'python:3.9-slim'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/IonZmeu/jenkins-test.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh 'python3 -m venv venv'
                sh 'source venv/bin/activate'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                source venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                source venv/bin/activate
                pytest
                '''
            }
        }

        stage('Build') {
            steps {
                echo 'Build step here'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}
