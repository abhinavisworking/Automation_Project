#!/bin/bash

##apache2 packages update##
echo "First, let's update the apache2 packages"
echo "Updating the packages now.."
sudo apt update -y

##apache2 package installation##
echo "Checking if apache2 service is Installed"
status=$(sudo systemctl status apache2)

if [[ $status == *"active"* ]]; then
echo "apache2 is Installed"
else echo "apache2 is not installed."
        sudo apt install apache2 -y
fi

##apache2 service status check##
echo "Checking if apache2 service is running"
servicestatus=$(systemctl status apache2)

if [[ $servicestatus == *"active (running)"* ]]; then
        echo "Service is healthy"
else
echo "Service is not in a healthy state, hence, starting the service:"
        systemctl start apache2
                echo "Service is up and running now"
fi

timestamp=$(date '+%d%m%Y-%H%M%S')

myname="abhinav"

s3_bucket="upgrad-abhinav"

##Creating a tar file for the logs##
echo "Creating tar file for logs under /var/log/apache2"
cd /var/log/apache2
tar -cvf ${myname}-httpd-logs-${timestamp}.tar *.log
mv *.tar /tmp/

##Moving tar to S3##
echo "Moving tar to now S3"

aws s3 \
cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
