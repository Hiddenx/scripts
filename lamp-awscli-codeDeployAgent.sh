#!/bin/bash
export DEBIAN_FRONTEND=noninteractive;
sudo -i;
sudo apt-get -y update;

#Install LAMP
sudo apt-get -y install mysql-server mysql-client mysql-workbench libmysqld-dev;
sudo apt-get -y install apache2 php5 libapache2-mod-php5 php5-mcrypt phpmyadmin;

#Set password to mysql-server; Not recommended - Uncomment the below line if you wish to use.
#sudo /usr/bin/mysqladmin -u root -h localhost password "YourLocal_MySQL_PASSWORD_HERE";
sudo /etc/init.d/mysql restart;

#Setting up phpmnyadmin interface at http://Your_IP/phpmyadmin
sudo apt-get install php5-curl;
sudo bash -c 'echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf';
sudo chmod 777 -R /var/www/html;
sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
sudo service apache2 restart;
sudo php5enmod mcrypt;
sudo service apache2 restart;
sudo a2enmod rewrite;
sudo service apache2 restart;
sudo apt-get -y install zip;

#Install AWSCli
sudo apt-get -y install python-pip;
sudo pip install awscli;


#Install AWS CodeDeploy Agent
sudo apt-get -y install ruby2.0;
sudo apt-get -y install wget;
cd /home/ubuntu;
wget https://aws-codedeploy-ap-south-1.s3.amazonaws.com/latest/install;
chmod +x ./install;
sudo ./install auto;
