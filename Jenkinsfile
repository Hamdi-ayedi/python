pipeline {
    agent any
    
    environment {
        namespace = 'default'
        dockerRegistryCredentials = 'docker-credentials-id'
        deploymentName = 'deployment'
        serviceName = 'service'
        dockerImage = 'ops'
        dockerTag = 'latest'
    }
    
    stages {
        stage('Build') {
            steps {

                sh 'pip install -r requirements.txt'
            
            }
        }
        
        stage('Docker Build and Push') {
            steps {

                sh 'docker build -t $dockerImage:$dockerTag .'
                sh 'docker push $dockerImage:$dockerTag'
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f deployment.yaml -n $namespace"
                    sh "kubectl apply -f service.yaml -n $namespace"
                }
            }
        }
    }
}
