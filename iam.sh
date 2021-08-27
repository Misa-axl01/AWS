#!/bin/bash
a=(camilo.agudelo@cadena.com.co camilo.piedrahita cristian.uribe@cadena.com.co giovani.castro idoc jlujan jose.acosta jose.restrepo juvenal.aguirre@cadena.com.co lida.montoya santiago.londono SoporteItera ticorporativas@cadena.com.co UserCadenaTI walter.montoya)
for i in ${a[*]}
do
	echo -ne "*******************************\n" >> policyusers.txt
	echo -ne "*USUARIO: ${i} \n" >> policyusers.txt
	echo -ne "*******************************" >> policyusers.txt
	echo -e "\n" >> policyusers.txt
  aws iam list-attached-user-policies --user-name $i --output table --profile ccorporativas >> policyusers.txt
        echo -e "\n" >> policyusers.txt
done
