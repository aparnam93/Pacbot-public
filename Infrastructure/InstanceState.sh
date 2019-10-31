instance_id=$(cd /var/lib/jenkins/workspace/t-github-multibranch_development/Infrastructure && terraform output instance_id)
instance_ip=$(cd /var/lib/jenkins/workspace/t-github-multibranch_development/Infrastructure && terraform output instance_ip)
if [[ $(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].State[].Name' --region us-east-1 --output text) = "stopped" ]] ; then \
    aws ec2 start-instances --instance-ids $instance_id --region us-east-1; \
fi
X_STATE=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].State[].Name' --region us-east-1 --output text)
while [ $X_STATE = "pending" ]; do 
    echo "- Waiting for running status"
    sleep 5
    OUT=$(aws ec2 describe-instances --instance-ids $instance_id --output text)
    X_STATE=$(echo "$OUT" | grep STATE | cut -f 3)   
done

if [[ $(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].State[].Name' --region us-east-1 --output text) = "stopped" ]] ; then \
    aws ec2 start-instances --instance-ids $instance_id --region us-east-1; \
fi
until (ssh -i /var/lib/jenkins/workspace/t-github-multibranch_development/Infrastructure/key.pem ec2-user@$instance_ip); do
    sleep 5
done

sudo su 
terraform --version
node -v
cd /home/ec2-user/
cat pacbot.txt
aws ec2 stop-instances --instance-ids $instance_id --region us-east-1;
