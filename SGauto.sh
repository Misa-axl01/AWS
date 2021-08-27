#echo "Script para agregar reglas a SG's V0.5"
#echo "Cuenta-Cliente: "
#read n_cuenta
echo "Introduce el ID de la instancia a la que se le agregara la regla: "
read Ins_id
#echo "introduce el puerto de acceso"
#read puerto
#echo "introduce el protocolo: tcp/udp"
#read protocol
echo "introduce el tipo de regla: ej. ssh, RDP, etc.."
read tipo
echo "Introduce la ip con su mascara"
read ip
echo "Introduce una descripción para la regla ej: R-01545"
read descr
echo "Te mostrare los SG´s de la instancia"
aws ec2 describe-instances --instance-ids $Ins_id --query 'Reservations[*].Instances[*].SecurityGroups[*].[
GroupName, GroupId]' --profile testing
echo "Inserta el id de SG al que deseas ingresar la regla: "
read sg_id
if [ `echo $tipo | tr [:upper:] [:lower:]` =  `echo ssh | tr [:upper:] [:lower:]` ];
then
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "'tcp'", "FromPort": '22', "ToPort": '22', "IpRanges": [{"CidrIp": "'"$ip"'", "Description": "'$descr'"}]}]' --output text --profile testing
else
	echo "no se puede agregar la regla"
fi
