pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from source control
                git branch: 'main', url: 'https://github.com/IonZmeu/jenkins-test.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Python dependencies
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Run Python tests
                sh 'pytest'
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
