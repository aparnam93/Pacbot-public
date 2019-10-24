pipeline {
    agent any
    stages {
        stage('Build Infrastructure') {
            steps {
                 echo 'Building your infrastructure'
                 sh 'terraform --version'
                 sh 'cd /var/lib/jenkins/workspace/t-github-multibranch_development/terraform/ && terraform init && terraform apply -lock=false -auto-approve'
            }
        }
    }
}
