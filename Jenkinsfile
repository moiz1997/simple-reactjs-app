pipeline {
    agent any

    stages {
    
        stage('Checkout') {
            steps {
                git 'https://github.com/moiz1997/simple-reactjs-app.git'
            }
        }

        stage('Dependency Installation') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t lab11 .'
            }
        }

        stage('Run Docker Image') {
            steps {
                sh 'docker run -d -p 5000:5000 lab11'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push lab11'
                }
            }
        }
    }
}