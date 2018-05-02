#!/bin/bash
setenforce 1
sed -i 's/permissive/enforcing/' /etc/selinux/config
yum install -y setroubleshoot-server
service auditd restart
mkdir /home/shiyanlou/website
chown -R --reference='/var/www/html/' /home/shiyanlou/website/
chcon -R --reference='/var/www/html/' /home/shiyanlou/website/
touch /home/shiyanlou/config
chcon -t httpd_sys_content_t /home/shiyanlou/config