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
                bash 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bash 'docker build -t lab11 .'
            }
        }

        stage('Run Docker Image') {
            steps {
                bash 'docker run -d -p 8080:8080 lab11'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'moizbhai97', passwordVariable: 'monkeykong12')]) {
                    bash 'docker login -u $Username -p $Password'
                    bash 'docker push lab11'
                }
            }
        }
    }
}