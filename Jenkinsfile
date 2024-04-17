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
                sh 'npm ci'
            }
        }

        stage('Build Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker build -t $DOCKER_USERNAME/lab11 .'
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker run -d -p 6230:6230 $DOCKER_USERNAME/lab11'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push $DOCKER_USERNAME/lab11'
                }
            }
        }
    }
}