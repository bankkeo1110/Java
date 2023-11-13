pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = 'nguyentinh215/helloworld_image' // Docker Hub username and image name
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
                    // First, remove the existing container if it exists
                    sh "docker rm -f helloworld_app || true"
                    // Then run the new container
                    sh "docker run -d --name helloworld_app -p 8081:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
       
        // Cleanup action (example: deleting temporary files)
        // Replace this with actual cleanup commands
        echo 'Performing cleanup actions'

        // Sending notifications (example: sending an email)
        // Replace this with actual notification commands
        echo 'Sending notifications'
    }
        
    }
}