#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo chmod 777 /var/www/html
sudo chmod 777 /var/www/html/index.nginx-debian.html
echo "this is the solution of terraform project at privat ec2 = $HOSTNAME" > /var/www/html/index.nginx-debian.html
echo "this is the solution of terraform project at privat ec2 = $HOSTNAME" > /var/www/html/index.html




