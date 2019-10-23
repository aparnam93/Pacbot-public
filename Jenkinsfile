pipeline {
  agent any
  parameters {
    booleanParam(name: 'InfraChange' , defaultValue: false )
  }
  
  stages {
    stage('Build Infrastructure') {
	    when {
            expression { params.InfraChange == 'true' }
        }
      steps {
        echo 'Building your infrastructure'
		sh 'terraform --version'
		sh 'cd /var/lib/jenkins/workspace/t-github-multibranch_development/terraform/ && terraform init && terraform destroy -lock=false -auto-approve'
      }
    }
    stage('Run pacbot Application') {
      steps {
        echo 'Running pacbot application installer file...'
      }
    }
  }
}
