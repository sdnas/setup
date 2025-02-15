#!/usr/bin/env bash

# Install prerequisites
sudo apt install software-properties-common -y

# Install LAMP Server
sudo apt update -y && sudo apt upgrade -y
sudo apt install lamp-server^ -y

# Install ondrej/php
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y

# Install composer 
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo "Composer hash: $HASH"
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo rm /tmp/composer-setup.php

# Install NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 20

