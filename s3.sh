#!/bin/bash
a=(02 03 04 05 06 07 08 09 10 11 12)
for i in ${a[*]}
do
  aws s3 cp s3://directv.cadenaportalgestion.com/2015/$i/CartasMorosidad/ s3://directv.cadenaportalgestion.com/2015/01/CartasMorosidad/ --storage-class STANDARD_IA --recursive --force-glacier-transfer --profile cadena
done
