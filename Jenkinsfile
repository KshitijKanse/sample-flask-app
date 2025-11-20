pipeline {
    agent any

    environment {
        // Replace with your Docker Hub username/repository or private registry details
        DOCKER_REGISTRY = "harbor-registry.mahity.local/mahity" 
        // Replace with the credential ID configured in Jenkins for your Docker registry
        DOCKER_CREDENTIAL_ID = "f2bc3daf-3d0f-4e3e-b69c-b7f5130a2108" 
        IMAGE_NAME = "flask-aap"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Replace with your SCM details (e.g., Git repository URL)
                git 'https://github.com/KshitijKanse/sample-flask-app.git' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the current directory
                    dockerImage = docker.build "${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}" 
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the built image to the configured Docker registry
                    docker.withRegistry("https://${DOCKER_REGISTRY}", DOCKER_CREDENTIAL_ID) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
