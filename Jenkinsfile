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
                // Create and activate a Python virtual environment
                sh '''
                python3 -m venv venv
                source venv/bin/activate
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Python dependencies inside the virtual environment
                sh '''
                source venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                // Run Python tests inside the virtual environment
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
