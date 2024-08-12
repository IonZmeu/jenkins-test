pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from source control
                git branch: 'main', url: 'https://github.com/IonZmeu/jenkins-test.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                // Set up Python virtual environment
                sh 'python3 -m venv venv'
                sh 'source venv/bin/activate'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Python dependencies within the virtual environment
                sh '''
                source venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                // Run Python tests within the virtual environment
                sh '''
                source venv/bin/activate
                pytest
                '''
            }
        }

        stage('Build') {
            steps {
                // Build step, if applicable
                echo 'Build step here'
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
