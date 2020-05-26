#!/bin/bash
a=(automaticos-SII avargas@confecamaras.org.co aws-log-SII carlos.martin cframirezm@confecamaras.org.co confemonitor db-backup dba dba@confecamaras.org.co frojas@confecamaras.org.co jesus.ramos@entelgy.com jhonatan.roncancio@entelgy.com jvargas monitoreo@confecamaras.org.co monitoring Nagios-Read oficialseguridad oficina.principal Parquantix Pentaho repoSii repositoriosii s3-backup-db s3-officina-ppal S3Camara-01 S3Camara-02 S3Camara-03 S3Camara-04 S3Camara-05 S3Camara-06 S3Camara-07 S3Camara-08 S3Camara-09 S3Camara-10 S3Camara-11 S3Camara-12 S3Camara-13 S3Camara-14 S3Camara-15 S3Camara-16 S3Camara-17 S3Camara-18 S3Camara-19 S3Camara-20 S3Camara-21 S3Camara-22 S3Camara-23 S3Camara-24 S3Camara-25 S3Camara-26 S3Camara-27 S3Camara-28 S3Camara-29 S3Camara-30 S3Camara-31 S3Camara-32 S3Camara-33 S3Camara-34 S3Camara-35 S3Camara-36 S3Camara-37 S3Camara-38 S3Camara-39 S3Camara-40 S3Camara-41 S3Camara-42 S3Camara-43 S3Camara-44 S3Camara-45 S3Camara-46 S3Camara-47 S3Camara-48 S3Camara-49 S3Camara-50 S3Camara-51 S3Camara-52 S3Camara-53 S3Camara-54 S3Camara-55 S3Camara-56 S3Camara-57 S3Camara-97 S3Camara-98 S3Confecamaras s3fs_user S3logsii s3user S3_cartago ses-smtp-user ses-smtp-user.20160218-091840 ses-smtp-user.20180207-121432 ses-smtp-user.20180216-173326 SoporteItera ti@confecamaras.org.co user-s3-docxflow usertags WebMas wposada@confecamaras.org.co ymeneses@confecamaras.org.co)
for i in ${a[*]}
do
	echo -ne "*******************************\n" >> policyusers.txt
	echo -ne "*USUARIO: ${i} \n" >> policyusers.txt
	echo -ne "*******************************" >> policyusers.txt
	echo -e "\n" >> policyusers.txt
  aws iam list-attached-user-policies --user-name $i --output table --profile sii >> policyusers.txt
        echo -e "\n" >> policyusers.txt
done
