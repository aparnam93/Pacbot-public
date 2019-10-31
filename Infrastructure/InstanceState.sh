if [[ $(aws ec2 describe-instances --instance-ids i-059c895c4b5d40a27 --query 'Reservations[].Instances[].State[].Name' --region us-east-1 --output text) = "stopped" ]] ; then \
    aws ec2 start-instances --instance-ids i-059c895c4b5d40a27 --region us-east-1; \
    fi
instance_ip=$(cd /var/lib/jenkins/workspace/t-github-multibranch_development/Infrastructure && terraform output instance_ip)
whoami
ssh -tt -i /var/lib/jenkins/workspace/t-github-multibranch_development/Infrastructure/key.pem ec2-user@$instance_ip

sudo su 
terraform --version
