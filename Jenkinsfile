pipeline {
  agent any
  parameters {
    booleanParam(name: 'InfraChange' , defaultValue: false )
    booleanParam(name: 'PacbotInstall' , defaultValue: false)
    string(name: 'terrformPath', defaultValue: '/var/lib/jenkins/workspace/t-github-multibranch_development/Infrastructure')
  }
  
  stages {
    stage('Build Infrastructure') {
	    when {
            expression { params.InfraChange == true }
        }
      steps {
        echo 'Building your infrastructure'
        sh 'terraform --version'
	sh 'cd ${terrformPath} && terraform init && terraform destroy -lock=false -auto-approve'*/
		sh 'cd ${terrformPath} && terraform output instance_id'
      }
    }
    stage('Check pacbot installer server status') {
       when {
            expression { params.PacbotInstall == true }
        }
       steps {
            echo 'Checking the status of pacbot installer server...'
			sh 'cd ${terrformPath} && sudo bash -x InstanceState.sh'
       }
    }
    stage('Re-deploy pacbot Application') {
       steps {
           echo 'Re-deploy pacbot application application....'
      }
    }  
	  
  }
}
