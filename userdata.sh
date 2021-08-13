#!/bin/sh
sudo su
yum install -y httpd
service httpd start
chkonfig httpd on
echo "<html>
<h1>You are viwing the Webserver installed using terraform</h1>
<h2>Please visit us by clicking the below URL</h2>
<a href="https://www.bbc.co.uk/">https://bbc.co.uk</a>
</html>" > /var/www/html/index.html
