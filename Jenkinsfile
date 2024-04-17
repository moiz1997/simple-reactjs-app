pipeline {
    agent {
        label 'jenkins_agent'
    }

    tools {
        nodejs 'nodejs'
        dockerTool 'docker'
    }

    stages {
    
        stage('Checkout') {
            steps {
                git 'https://github.com/moiz1997/simple-reactjs-app.git'
            }
        }

        stage('Initialize'){
            steps {
                script {
                    def dockerHome = tool 'docker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }

        stage('Dependency Installation') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t lab11 .'
            }
        }

        stage('Run Docker Image') {
            steps {
                sh 'sudo docker run -d -p 3000:3000 lab11'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'moizbhai97', passwordVariable: 'monkeykong12')]) {
                    sh 'sudo docker login -u $Username -p $Password'
                    sh 'sudo docker push lab11'
                }
            }
        }
    }
}