#!/bin/bash
#Create by Shk
#date 07/06/2017
#v2
#Comment:
clear
cat /etc/*release
echo "     "
echo "     "
echo "     "
echo "###  Install Nagios ####"
echo "Que Linux es:"
echo "1.- Amazon Linux | Centos 6.8 | RH 6.8 " 
echo "2.- Debian | Ubuntu"
echo "3.- Centos 7 | RH 7"
echo "4.- Suse"
  read x
  case $x in
     1)
echo "Install....."
if [ -f /etc/yum.repos.d/epel.repo ]
then
yum --enablerepo=epel install nrpe nagios-plugins-nrpe nagios-plugins-disk nagios-plugins-dns nagios-plugins-icmp nagios-plugins-smtp nagios-plugins-ssh unzip -y
else
wget https://s3.amazonaws.com/servicemanager.iteraprocess.org/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
yum --enablerepo=epel install nrpe nagios-plugins-nrpe nagios-plugins-disk nagios-plugins-dns nagios-plugins-icmp nagios-plugins-smtp nagios-plugins-ssh unzip -y
rm -f epel-release-6-8.noarch.rpm
fi
echo "Config....."
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1,1.0.0.46/g' /etc/nagios/nrpe.cfg
sed -i 's/dont_blame_nrpe=0/dont_blame_nrpe=1/g' /etc/nagios/nrpe.cfg
echo 'command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$' >> /etc/nagios/nrpe.cfg
echo 'command[check_mem]=/usr/lib64/nagios/plugins/check_mem -u -C -w $ARG1$ -c $ARG2$' >> /etc/nagios/nrpe.cfg
echo 'command[check_cpu_usage]=/usr/lib64/nagios/plugins/check_cpu_usage -w $ARG1$ -c $ARG2$' >> /etc/nagios/nrpe.cfg
echo 'command[check_swap]=/usr/lib64/nagios/plugins/check_swap $ARG1$ $ARG2$' >> /etc/nagios/nrpe.cfg
cd  /usr/lib64/nagios/plugins/
wget https://s3.amazonaws.com/servicemanager.iteraprocess.org/nagios-scripts2.zip
unzip -o nagios-scripts2.zip
chkconfig nrpe on
service nrpe start
echo "Start Services....."
echo "Enable Swap....."
echo "           "
swapon -s
echo "Crear Swap?"
echo "y / n"
read va1
if [ $va1 = y ]
then
dd if=/dev/zero of=/swapfile bs=1M count=512
mkswap /swapfile
chmod 600 /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab
cat /etc/fstab
swapon -s
fi
echo "     "
echo "     !!!!!!!!!!!     "
echo "Press Any Key to Exit"
read var
echo "Finish ....."
     ;;
     2)
echo "Install....."
#apt-get install unzip  nagios-plugins -y
#wget http://mirrors.kernel.org/ubuntu/pool/main/n/nagios-nrpe/nagios-nrpe-server_2.15-0ubuntu1_amd64.deb
#dpkg -i nagios-nrpe-server_2.15-0ubuntu1_amd64.deb
#dpkg -l | grep nrpe
#rm -f nagios-nrpe-server_2.15-0ubuntu1_amd64.deb
apt-get install nagios-nrpe-server nagios-plugins
echo "Config....."
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1,1.0.0.46/g' /etc/nagios/nrpe.cfg
sed -i 's/dont_blame_nrpe=0/dont_blame_nrpe=1/g' /etc/nagios/nrpe.cfg
echo 'command[check_disk]=/usr/lib/nagios/plugins/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$' >> /etc/nagios/nrpe.cfg
echo 'command[check_mem]=/usr/lib/nagios/plugins/check_mem -u -C -w $ARG1$ -c $ARG2$' >> /etc/nagios/nrpe.cfg
echo 'command[check_cpu_usage]=/usr/lib/nagios/plugins/check_cpu_usage -w $ARG1$ -c $ARG2$' >> /etc/nagios/nrpe.cfg
echo 'command[check_swap]=/usr/lib/nagios/plugins/check_swap $ARG1$ $ARG2$' >> /etc/nagios/nrpe.cfg
cd  /usr/lib/nagios/plugins/
wget https://s3.amazonaws.com/servicemanager.iteraprocess.org/nagios-scripts2.zip
unzip -o nagios-scripts2.zip
/etc/init.d/nagios-nrpe-server restart
echo "Start Services....."
echo "Enable Swap....."
echo "           "
swapon -s
echo "Crear Swap?"
echo "y / n"
read va1
if [ $va1 = y ]
then
dd if=/dev/zero of=/swapfile bs=1M count=512
mkswap /swapfile
chmod 600 /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab
cat /etc/fstab
swapon -s
fi
echo "     "
echo "     !!!!!!!!!!!     "
echo "Press any key to Exit"
read var
echo "Finish ....."
     ;;
     3)
echo "Install....."
yum install wget bc unzip perl -y 
wget https://s3.amazonaws.com/servicemanager.iteraprocess.org/epel-release-7-10.noarch.rpm
rpm -ivh epel-release-7-10.noarch.rpm
yum --enablerepo=epel install nrpe nagios-plugins-nrpe nagios-plugins-disk nagios-plugins-dns nagios-plugins-icmp nagios-plugins-smtp nagios-plugins-ssh unzip -y
rm -f epel-release-7-10.noarch.rpm
echo "Config....."
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1,1.0.0.46/g' /etc/nagios/nrpe.cfg
sed -i 's/dont_blame_nrpe=0/dont_blame_nrpe=1/g' /etc/nagios/nrpe.cfg
echo 'command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$' >> /etc/nagios/nrpe.cfg
echo 'command[check_mem]=/usr/lib64/nagios/plugins/check_mem -u -C -w $ARG1$ -c $ARG2$' >> /etc/nagios/nrpe.cfg
echo 'command[check_cpu_usage]=/usr/lib64/nagios/plugins/check_cpu_usage -w $ARG1$ -c $ARG2$' >> /etc/nagios/nrpe.cfg
echo 'command[check_swap]=/usr/lib64/nagios/plugins/check_swap $ARG1$ $ARG2$' >> /etc/nagios/nrpe.cfg
cd /usr/lib64/nagios/plugins/
wget https://s3.amazonaws.com/servicemanager.iteraprocess.org/nagios-scripts2.zip
unzip -o nagios-scripts2.zip
systemctl enable nrpe
systemctl start nrpe
echo "Start Services....."
echo "Enable Swap....."
echo "           "
swapon -s
echo "Crear Swap?"
echo "y / n"
read va1
if [ $va1 = y ]
then
dd if=/dev/zero of=/swapfile bs=1M count=512
mkswap /swapfile
chmod 600 /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab
cat /etc/fstab
swapon -s
fi
echo "     "
echo "     !!!!!!!!!!!     "
echo "Press any key to Exit"
read var
echo "Finish ....."   
     ;;
     4)
        echo "No Disponible"
     ;;
     *)
        echo "Exit"
     ;;
  esac
