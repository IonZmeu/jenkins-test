pipeline {
    agent {
        docker {
            image 'python:3.11' // Use the Python Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock -u root -p 9090:9090' // Map port 9090
        }
    }

    environment {
        APP_PID_FILE = '/tmp/flask_app.pid' // Path to the PID file
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
                    // Prepare directory structure
                    sh 'mkdir -p templates'
                    sh 'mv index.html templates/'

                    // Stop any previously running application
                    sh '''
                        if [ -f ${APP_PID_FILE} ]; then
                            kill $(cat ${APP_PID_FILE}) || true
                            rm ${APP_PID_FILE}
                        fi
                    '''

                    // Run your Python application in the background
                    sh '''
                        nohup python app.py > app.log 2>&1 &
                        echo $! > ${APP_PID_FILE}
                    '''
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
            // Stop the application if it's still running
            //sh '''
            //    if [ -f ${APP_PID_FILE} ]; then
            //        kill $(cat ${APP_PID_FILE}) || true
            //        rm ${APP_PID_FILE}
            //    fi
            //'''
        }
    }
}
