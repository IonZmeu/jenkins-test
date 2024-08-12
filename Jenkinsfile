pipeline {
    agent any
    stages {
        stage('Check Docker') {
            steps {
                script {
                    // Print current PATH and check Docker
                    sh '''
                    echo "Current PATH: $PATH"
                    which docker
                    if command -v docker > /dev/null; then
                        echo "Docker is installed."
                        docker --version
                    else
                        echo "Docker is not installed, attempting to install Docker..."
                        
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
                    fi
                    '''
                    
                    // Verify Docker installation and pull the required image
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
