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
                // Create a Python virtual environment
                sh 'python3 -m venv venv'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Python dependencies using the virtual environment's pip
                sh 'venv/bin/pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Run Python tests using the virtual environment's pytest
                sh 'venv/bin/pytest'
            }
        }

        stage('Run Flask App') {
            steps {
                // Run the Flask application in the background
                sh 'nohup venv/bin/python app.py &'
                // Wait a few seconds to allow the Flask app to start
                sh 'sleep 5'
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
