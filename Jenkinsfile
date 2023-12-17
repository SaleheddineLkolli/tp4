pipeline {
    environment {
        registry = "saleheddinelkolli/tp4"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']], 
                              userRemoteConfigs: [[url: 'https://github.com/SaleheddineLkolli/tp4.git']]])
                }
            }
        }
        stage('Building image') {
            steps {
                script {
                dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                echo "Docker image built: $dockerImage"
                }
            }
        }

        stage('Test image') {
            steps {
                script {
                    def inspectStatus = sh(script: "docker inspect $dockerImage", returnStatus: true)
                    def runStatus = sh(script: "docker run --rm $dockerImage my_test_command", returnStatus: true)

                    if (inspectStatus == 0 && runStatus == 0) {
                        echo "Tests passed"
                    } else {
                        error "Tests failed"
                    }
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
