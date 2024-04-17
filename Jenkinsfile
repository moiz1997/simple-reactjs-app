pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('dockerHubCredentials')
    }
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
                sh 'docker build -t $DOCKERHUBCREDENTIALS_USR/lab11 .'
            }
        }
        
        stage('Run Docker Image') {
            steps {
                sh 'docker run -d -p 6237:6237 $DOCKERHUBCREDENTIALS_USR/lab11'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'echo $DOCKERHUBCREDENTIALS_PSW | docker login -u $DOCKERHUBCREDENTIALS_USR --password-stdin'
                sh 'docker push $DOCKERHUBCREDENTIALS_USR/lab11'
            }
        }
    }
}