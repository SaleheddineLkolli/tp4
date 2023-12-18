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
                    sh "docker inspect $dockerImage"
                    // Run a simple command within the Docker container (replace with your test command)
                    sh "docker run --rm $dockerImage echo 'Test passed'"
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
        }
    }
}
