#!/bin/bash

O1=865215585341

OM=216176894836

n=1

PO1="--profile overlap"

POM="--profile overlapm"

#For para que vaya línea por línea realizando el procedimiento

for i in $(wc Overlap_Tags -l | awk '{ print $1 }')
do
cuenta=`cat Overlap_Tags|awk '{ print $3 }'|cut -d "#" -f2|head -$n|tail -1`
id=`cat Overlap_Tags|awk '{ print $7 }'|cut -d "#" -f2|head -$n|tail -1`
pro=`cat Overlap_Tags|awk '{ print $4}'|cut -d "#" -f2|head -$n|tail -1`
echo $n
echo hola
n=$((n + 1))
echo $n
done
