pipeline {
    agent any
    stages {
        stage('Check Docker') {
            steps {
                script {
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
