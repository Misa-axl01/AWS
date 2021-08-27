#!/bin/bash

O1=865215585341

OM=216176894836

n=1

PO1="--profile overlap"

POM="--profile overlapm"

#For para que vaya línea por línea realizando el procedimiento
while IFS="," read cliente cuenta id ip tag
do
cuenta=`echo $cuenta |sed 's/#//'`
  if [ $cuenta = $O1 ]
     then 
        aws ec2 create-tags --resources ${id} --tags Key=Proyecto,Value="${tag}" $PO1
     else 
        aws ec2 create-tags --resources ${id} --tags Key=Proyecto,Value="${tag}" $POM
   fi
n=$((n + 1))
done < eip_over 
