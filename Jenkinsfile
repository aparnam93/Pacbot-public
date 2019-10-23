pipeline {
  agent any
  stages {
    stage('Build Infrastructure') {
      steps {
        echo 'Building your infrastructure'
		sh 'terraform --version'
		sh 'cd /var/lib/jenkins/workspace/t-github-multibranch_development/terraform'
		sh 'terraform apply'		
      }
    }
    stage('Run pacbot Application') {
      steps {
        echo 'Running pacbot application installer file'
      }
    }
  }
}
