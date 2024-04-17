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
                sh 'docker build -t ${env.DOCKER_CREDENTIALS_USR}/lab11 .'
            }
        }

        stage('Run Docker Image') {
            steps {
                sh 'docker run -d -p 6230:6230 ${env.DOCKER_CREDENTIALS_USR}/lab11'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker login -u ${env.DOCKER_CREDENTIALS_USR} -p ${env.DOCKER_CREDENTIALS_PSW}"
                sh "docker push ${env.DOCKER_CREDENTIALS_USR}/lab11"
            }
        }
    }
}