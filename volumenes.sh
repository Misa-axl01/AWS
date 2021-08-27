#!/bin/bash

O1=865215585341

OM=216176894836

n=1

PO1="--profile overlap"

POM="--profile overlapm"

#For para que vaya línea por línea realizando el procedimiento

for i in $(cat overlap_volumenes)
do
cuenta=`echo $i |cut -d "," -f2|sed 's/#//'`
idv=`echo $i | cut -d "," -f5`
value=`echo "$i" |cut -d "," -f4`
#echo $idv
  if [ $cuenta = $O1 ]
     then 
          aws ec2 create-tags --resources ${idv} --tags Key=Proyecto,Value=${value} $PO1
sleep 3
     else 
          aws ec2 create-tags --resources ${idv} --tags Key=Proyecto,Value=${value} $POM

sleep 3
   fi
n=$((n + 1))
done
