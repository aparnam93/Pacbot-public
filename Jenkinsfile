pipeline {
  agent any
  stages {
    stage('Build Infrastructure') {
      steps {
        echo 'Building your infrastructure'
		    sh 'terraform --version'
      }
    }
    stage('Run pacbot Application') {
      steps {
        echo 'Running pacbot application installer file'
      }
    }
  }
}
