pipeline {
    agent any
    stages {
        stage('Check Docker') {
            steps {
                script {
                    def dockerInstalled = sh(script: 'command -v docker || true', returnStatus: true)
                    
                    if (dockerInstalled != 0) {
                        echo 'Docker not found, attempting to install Docker...'
                        sh '''
                        # Update package information
                        sudo apt-get update

                        # Install required packages
                        sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

                        # Add Docker’s official GPG key
                        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

                        # Set up the stable repository
                        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

                        # Install Docker
                        sudo apt-get update
                        sudo apt-get install -y docker-ce
                        '''
                    } else {
                        echo 'Docker is already installed.'
                    }
                    
                    sh 'docker --version'
                    sh 'docker pull python:3.12.5-alpine3.20'
                }
            }
        }
        stage('Build') {
            agent { docker { image 'python:3.12.5-alpine3.20' } }
            steps {
                sh 'python --version'
            }
        }
    }
}
