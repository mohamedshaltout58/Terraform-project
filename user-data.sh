#!/bin/bash
sudo apt update
sudo apt install nginx -y
echo "This is the solution of lab3 terraform from Private-EC2 $HOSTNAME" > /var/www/html/index.html




