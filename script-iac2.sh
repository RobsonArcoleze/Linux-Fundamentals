#!/bin/bash

echo "Atualizando sistema..."

apt-get update
apt-get upgrade -y


echo "Instalando recursos..."

apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e copiando os arquivos da aplicação..."

cd/tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio
cp -R * /var/www/html


echo "FIM..."

