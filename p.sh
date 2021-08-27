pre=(02/mau/zared 01/misa/abi)
for i in ${pre[*]}
do
	#echo $i
	aws s3api list-object-versions --bucket abipruebabucket --prefix $i --profile testing |grep "Key"|cut -d"|" -f4 | while read obj
        do
		KEY=$( echo $obj)
		echo $KEY
	done	
done
