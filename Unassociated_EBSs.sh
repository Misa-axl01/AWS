for REGION in $(aws ec2 describe-regions --output text --query 'Regions[].[RegionName]' --profile testing) ; do echo $REGION && aws ec2 describe-volumes --filter "Name=status,Values=available" --query 'Volumes[*].{VolumeID:VolumeId,Size:Size,Type:VolumeType,AvailabilityZone:AvailabilityZone,Tag:Tags}' --region $REGION --profile testing; done