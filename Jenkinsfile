pipeline {
  agent any
  parameters {
    booleanParam(name: 'InfraChange' , defaultValue: false )
    booleanParam(name: 'PacbotInstall' , defaultValue: false )
  }
  stages {
    stage('Build Infrastructure') {
	    when {
            expression { params.InfraChange == 'true' }
        }
      steps {
        echo 'Building your infrastructure'
        sh 'terraform --version'
        sh 'cd /var/lib/jenkins/workspace/t-github-multibranch_development/terraform/ && terraform init && terraform apply -lock=false -auto-approve'
      }
    }
  }
}
