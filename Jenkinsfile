pipeline {
  agent any
  parameters {
<<<<<<< HEAD
    booleanParam(name: 'InfraChange' , defaultValue: false )
    booleanParam(name: 'PacbotInstall' , defaultValue: false)
=======
    booleanParam(name: 'InfraChange' , defaultValue: true )
    booleanParam(name: 'PacbotInstall')
>>>>>>> 3e22fd0b8e2307850bdfaabddd286715d7bfa4ad
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
<<<<<<< HEAD
	    sh 'cd ${terrformPath} && terraform init && terraform apply -lock=false -auto-approve'
=======
	      sh 'cd ${terrformPath} && terraform init && terraform apply -lock=false -auto-approve'
>>>>>>> 3e22fd0b8e2307850bdfaabddd286715d7bfa4ad
      }
    }
    stage('Check ') {
       when {
            expression { params.PacbotInstall == true }
        }
       steps {
            echo 'Running pacbot application installer file...'
	    sh 'whoami'
	    sh 'sudo su && ssh -i /home/ec2-user/key.pem ec2-user@172.26.10.190 "sudo su && python3 /opt/pacbot/installer/manager.py status"'
       }
    }
    stage('Re-deploy pacbot Application') {
       steps {
           echo 'Re-deploy pacbot application application....'
      }
    }  
	  
  }
}
