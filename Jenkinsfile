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

        //stage('Run Tests') {
        //    steps {
        //        // Run Python tests using the virtual environment's pytest
        //        sh 'venv/bin/pytest'
        //    }
        //}

        stage('Build Executable') {
            steps {
                // Create a standalone executable using PyInstaller
                sh '''
                ./venv/bin/pyinstaller --onefile --add-data 'index.html:.' app.py
                '''
            }
        }

        stage('Run Executable') {
            steps {
                // Run the built executable in the background
                sh 'nohup ./dist/app &'
                // Wait a few seconds to ensure the app starts
                sh 'sleep 5'
            }
        }

        stage('Build') {
            steps {
                // Additional build steps, if needed
                echo 'Additional build steps here'
            }
        }
    }

    post {
        always {
            // Clean up or notify after pipeline completion
            archiveArtifacts 'dist/app'
            echo 'Pipeline completed'
        }
    }
}
