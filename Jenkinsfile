pipeline {
  agent any
  stages {
    stage('development-branch') {
      steps {
        echo 'run this stage - ony if the branch = development branch'
         sh 'echo Building ${BRANCH_NAME}...'
      }
    }
    stage('testing') {
      steps {
        echo 'run this stage - ony if the branch = master branch'
         sh 'echo Building ${BRANCH_NAME}...'
      }
    }
  }
}
