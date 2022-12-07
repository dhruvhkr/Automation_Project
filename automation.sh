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

size=$(stat -c%s /tmp/$filename)

if [ sudo -f "/var/www/html/inventory.html" ]
then
        echo "Creating cat /var/www/html/inventory.html"
        sudo cat > /var/www/html/inventory.html
else
        echo "File Already Exist"
        sudo echo httpd-logs ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'$timestamp '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'tar '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' $size '&nbsp;' >> /var/www/html/inventory.html
        sudo echo '<br>' >> /var/www/html/inventory.html
fi


sudo cat > /etc/cron.d
sudo echo '00 08 * * * /bin/sh/ /home/ubuntu/automatin.sh' /etc/cron.d