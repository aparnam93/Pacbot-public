if [[ $(aws ec2 describe-instances --instance-ids i-0541ace858cabc87a --query 'Reservations[].Instances[].State[].Name' --output text) = "running" ]] ; then \
    aws ec2 stop-instances --instance-ids i-0541ace858cabc87a; \
    elif [[ $(aws ec2 describe-instances --instance-ids i-0541ace858cabc87a --query 'Reservations[].Instances[].State[].Name' --output text) = "stopped" ]] ; then \
    aws ec2 start-instances --instance-ids i-0541ace858cabc87a ; \
    fi