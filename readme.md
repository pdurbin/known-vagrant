# Installing Known on Ubuntu 14.04 in Vagrant

## Create and provision Vagrant VM 

`vagrant up`

## Set up Known

Visit <http://localhost:8000> and step through the wizard using the database name, username, and password below.

When you are prompted to configure `config.ini`, use the version below with the "url" parameter in place because in Vagrant we are forwarding port 80 on the Ubuntu VM to port 8000 on our laptop:

    [pdurbin@localhost known-vagrant]$ vagrant ssh
    vagrant@vagrant-ubuntu-trusty-64:~$ sudo -i
    root@vagrant-ubuntu-trusty-64:~# cp /known/vagrant/files/var/www/html/config.ini /var/www/html/config.ini
    root@vagrant-ubuntu-trusty-64:~# cat /var/www/html/config.ini
    # This configuration file was created by Known's installer.

    database = 'MySQL'
    dbname = 'known'
    dbpass = 'known'
    dbuser = 'known'
    dbhost = 'localhost'

    filesystem = 'local'
    uploadpath = '/tmp/'

    url = 'http://localhost:8000/'
    root@vagrant-ubuntu-trusty-64:~# 

Now you should be able to continue the setup at <http://localhost:8000/warmup/settings.php>
