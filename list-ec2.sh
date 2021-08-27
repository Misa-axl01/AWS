for region in $(aws ec2 describe-regions --output text --profile creamosweb| cut -f4)
do
     echo -e "\nInstances in region: $region" >> listado.txt
     aws ec2 describe-instances \
    --filter Name=tag-key,Values=Name \
    --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value}' \
    --output table \
    --region $region \
   --profile creamosweb >> listado.txt 
done
