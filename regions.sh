for region in $(aws ec2 describe-regions --output text --profile creamosweb| cut -f4)
do
     echo -e "\nInstances status in region: $region"
done
