#!/bin/sh
# Author : Swaroop Bapat
myname="swaroop"
timestamp=$(date '+%d%m%Y-%H%M%S')
s3_bucket="upgrad-swaroop"
#to install aws CLI
sudo apt update
sudo apt install awscli
#to install apache2 on ubuntu, status of apache2, enabling it post reboot
# 4 steps
sudo apt update
sudo apt install apache2
sudo systemctl status apache2
sudo systemctl enable apache2
#go to access logs path
cd /var/log/apache2
#creation of tar
sudo tar -cf swaroop-httpd-logs-${timestamp}.tar access.log
#copy tar to tmp folder(directory)
sudo cp swaroop-httpd-logs-${timestamp}.tar /tmp
#copy files to S3 bucket
aws s3 cp swaroop-httpd-logs-${timestamp}.tar s3://upgrad-swaroop 

