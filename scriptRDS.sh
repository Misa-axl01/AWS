#!/bin/bash

O1=865215585341

OM=216176894836

n=1

PO1="--profile overlap"

POM="--profile overlapm"

#For para que vaya línea por línea realizando el procedimiento

for i in $(cat Overlap_TagsRDS)
do
cuenta=`echo $i |cut -d ":" -f2|sed 's/#//'`
id=`echo $i| cut -d ":" -f3`
pro=`echo $i|cut -d ":" -f4`
echo $n
  if [ $cuenta = $O1 ]
     then 
  	   aws rds add-tags-to-resource --resource-name arn:aws:rds:us-east-1:$cuenta:db:$id --tags Key=PROYECTO,Value=$pro $PO1
sleep 3
     else 
  	   aws rds add-tags-to-resource --resource-name arn:aws:rds:us-east-1:$cuenta:db:$id --tags Key=PROYECTO,Value=$pro $POM
sleep 3
   fi
n=$((n + 1))
done
