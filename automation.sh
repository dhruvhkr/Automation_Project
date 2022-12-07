bucket=s3://upgrad-dhruv
timestamp=$(date '+%d%m%Y-%H%M%S')

filename=Dhruv-httpd-logs-$timestamp.tar
sudo apt update -y

 dpkg -s apache2 &> /dev/null

    if [ $? -ne 0 ]

        then
            echo "not installed"
            sudo apt-get install apache2

        else
            echo    "installed"
    fi

#!/bin/bash
if [ $(/etc/init.d/apache2 status | grep -v grep | grep 'apache2 is running' | wc -l) > 0 ]
then
 echo "Server is running."
else
  echo "Starting server"
  systemctl
fi

sudo tar -cf /tmp/$filename /var/log/apache2/

aws s3 cp /tmp/$filename $bucket