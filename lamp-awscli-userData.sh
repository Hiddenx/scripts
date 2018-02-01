#!/bin/sh
export DEBIAN_FRONTEND=noninteractive;


# Update Ubuntu
apt-get update;
apt-get -y upgrade;

# Install Apache/MySQL
apt-get -y install apache2 php5 php5-mysql mysql-server mysql-client unzip;
#/usr/bin/mysqladmin -u root -h localhost password "test123";
apt-get -y install libapache2-mod-php5 php5-mcrypt php5-curl;
chmod 777 -R /var/www/;
printf "<?php phpinfo(); ?>" > /var/www/html/info.php;
service apache2 restart;
php5enmod mcrypt;
service apache2 restart;
a2enmod rewrite;
service apache2 restart;


#Install AWSCli

apt-get -y install python-pip;
pip install awscli;


#Install CodeDeployAgent

apt-get -y install ruby2.0;
apt-get -y install wget;
cd /home/ubuntu;
wget https://aws-codedeploy-ap-south-1.s3.amazonaws.com/latest/install;
chmod +x ./install;
./install auto;
