#!/bin/sh
echo "Installing Known..."
# http://stackoverflow.com/questions/7739645/install-mysql-on-ubuntu-without-password-prompt
export DEBIAN_FRONTEND=noninteractive
apt-get -y install unzip apache2 php5-common mysql-server mysql-server-5.5 php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-gd php5-intl php5-mysql php5-oauth php5-xmlrpc
/etc/init.d/apache2 start
/etc/init.d/mysql start
mysqladmin -u root password your_password
mysql -u root -pyour_password -e 'create database known;'
mysql -u root -pyour_password -e "grant all privileges on known.* to 'known'@'localhost' identified by 'known';"
mysql -u root -pyour_password -e 'flush privileges;'
cd /var/www
mv html html.moved
wget http://assets.withknown.com/releases/known-0.6.3.zip
unzip known-0.6.3.zip
mv known-0.6.3 html
a2enmod rewrite
cp -a /etc/apache2/apache2.conf /etc/apache2/apache2.conf.orig
cp /known/vagrant/files/etc/apache2/apache2.conf /etc/apache2/apache2.conf
/etc/init.d/apache2 restart
echo "If all went well, configure Known at http://localhost:8000"
