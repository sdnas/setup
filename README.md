# Environment Setup

## Installation

After cloning this repository, `cd` into and run:

> Note: before running `setup.sh`, please review and edit the file to your liking.

```bash
chmod +x ./setup.sh
sudo ./setup.sh
```

---

## The setup.sh file

The file contains installation scripts for various development tools and packages.

The installer will attempt to install the following:

- LAMP Server
- Composer Dependency Manager for PHP
- nvm for NodeJS version management

Please see `setup.sh` from complete list.

---

## Post-installation

The following are post-installation steps that you may opt-in to setup.

### MySQL
```bash
sudo mysql_secure_installation
// Use this answers
> New Password: root
> Re-enter Password: root
> Remove anonymous users: y
> Disallow remote login: y
> Remove test database: y
> Reload privileges: y
# When accessing mysql via terminal, use sudo
sudo mysql -uroot -p
> password: root
```

### Add PHPMyAdmin
```bash
sudo apt-get install phpmyadmin
> select `apache`, if prompted
```

### Restart Services
```bash
sudo service apache2 restart
sudo service mysql restart
```

### Add Virtual Hosts
```bash
mkdir ~/Code
# Backup the default 'html' folder
sudo mv /var/www/html /var/www/html.bk
sudo ln -s ~/Code /var/www/html
# Run this if localhost is forbidden 
sudo usermod -g www-data $USER  
```

If all goes well, remove the `html.bk` folder.

```bash
sudo rm -r /var/www/html.bk
```

### SQLSTATE[HY000][1698]

This error will you see when you login in phpmyadmin, to fix this run the following code below:

```bash
sudo mysql -uroot -p #by default p = root
# Copy and paste this code
DROP USER root@localhost;
# change root_password based on your choice
CREATE USER root@localhost IDENTIFIED BY 'root_password'; 
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
```