pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = 'nguyentinh215/helloworld_IMAGE' // Docker Hub username and image name
        DOCKER_REGISTRY_CREDENTIALS = 'Docker' // Jenkins credential ID for Docker Hub
    }

    stages {
        stage('Checkout') {
            steps {
                // Get code from the GitHub repository
                checkout scm
                dir('helloworld') {
                    // All subsequent commands will be run inside the 'helloworld' directory
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Building Docker image
                    docker.build("$DOCKER_IMAGE")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    mvn test
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Login to Docker Hub and push the Docker image
                    docker.withRegistry('', DOCKER_REGISTRY_CREDENTIALS) {
                        docker.image("$DOCKER_IMAGE").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Pull the latest Docker image and run it
                    sh "docker pull $DOCKER_IMAGE"
                    sh "docker run -d --name helloworld_app -p 8081:8080 $DOCKER_IMAGE"
                    // The '-p 8081:8080' maps port 8080 inside the container to port 8081 on your host
                }
            }
        }
    }

    post {
        always {
            Cleanup, sending notifications
        }
    }
}