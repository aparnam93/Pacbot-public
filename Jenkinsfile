pipeline {
  agent any
  stages {
    stage('Build Infrastructure') {
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
