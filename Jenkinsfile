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
                    bat "docker rm -f helloworld_app || true"

                      // Pull the latest Docker image and run it
                    bat "docker pull $DOCKER_IMAGE"
                   
                    bat "docker run -d --name helloworld_app -p 8081:8080 $DOCKER_IMAGE"
                    // The '-p 8081:8080' maps port 8080 inside the container to port 8081 on your host
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