if [[ $(aws ec2 describe-instances --instance-ids i-0541ace858cabc87a --query 'Reservations[].Instances[].State[].Name' --region us-east-1 --output text) = "stopped" ]] ; then \
    aws ec2 start-instances --instance-ids i-0541ace858cabc87a ; \
    fi