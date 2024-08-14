pipeline {
    agent {
        docker {
            image 'python:3.11' // Use the Python Docker image (replace with your desired version)
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket if needed
        }
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from source control
                git branch: 'main', url: 'https://github.com/IonZmeu/jenkins-test.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install dependencies inside the Python container
                    sh 'pip install -r requirements.txt'
                }
            }
        }

        stage('Run Application') {
            steps {
                script {
                    // Run your Python application
                    sh 'python app.py'
                }
            }
        }

        stage('Test Application') {
            steps {
                // Additional steps to test or interact with the running application
                echo 'Running tests or additional checks here'
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
