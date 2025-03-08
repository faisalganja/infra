pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        STACK_NAME = 'my-node-app-stack'
        ARTIFACT_BUCKET = 'your-artifact-bucket'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-org/infra-repo.git'
            }
        }

        stage('Deploy Infrastructure') {
            steps {
                script {
                    def BUILD_NUMBER = currentBuild.getPreviousBuild()?.number ?: 'latest'
                    dir('scripts') {
                        sh "./deploy.sh ${ARTIFACT_BUCKET} ${BUILD_NUMBER} ${STACK_NAME}"
                    }
                }
            }
        }
    }
}