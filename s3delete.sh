aws s3api list-object-versions --bucket fonval.cadenaportalgestion.com --prefix 2015/08/208-07 --output text --profile cadena-transpaso|grep "DELETEMARKERS" | while read obj
   do
        KEY=$( echo $obj| awk '{print $3}')
        VERSION_ID=$( echo $obj | awk '{print $5}')
        echo $KEY
        echo $VERSION_ID
       # aws s3api delete-object --bucket $1 --key $KEY --version-id $VERSION_ID

   done
