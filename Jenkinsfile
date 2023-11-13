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
                // Stop and remove the previous container if it exists
                sh "docker stop helloworld_app || true"
                sh "docker rm helloworld_app || true"

                // Pull the latest Docker image
                sh "docker pull $DOCKER_IMAGE"

                // Run the new container with specific configurations
                sh """
                docker run -d --name helloworld_app \
                    -p 8081:8080 \
                    -e MY_ENV_VAR=my_value \
                    -v /my/host/directory:/my/container/directory \
                    --network my_network \
                    --memory=512m --cpus=1.0 \
                    $DOCKER_IMAGE
                """

                // Optional: Add a basic health check
                sh """
                for i in {1..5}; do
                    if docker exec helloworld_app curl -f http://localhost:8080; then
                        echo 'Application started successfully'
                        break
                    fi
                    echo 'Waiting for application to start...'
                    sleep 10
                done
                """

                // Optional: Fetch logs for immediate insight
                sh "docker logs helloworld_app"
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