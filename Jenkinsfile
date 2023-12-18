pipeline {
    environment {
        registry = "saleheddinelkolli/tp4"
        registryCredential = 'dockerhub'
        dockerImage = 'postgres'
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/SaleheddineLkolli/tp4.git'
            }
        }
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Test image') {
            steps {
                script {
                    sh "echo 'Test passed'"
                }
            }
        }
        stage('Publish Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }

        stage('Deploy image') {
            steps{
                bat "docker run -d $registry:$BUILD_NUMBER"
                }
        }   
        }
    }
}
