#!/bin/bash
sudo service $1 status &> /dev/null
case $? in
0)
    echo "is Running";;
1)
    echo "Error: Service Not Found";;
3)
    sudo service $1 start
    echo "Restarting";;
esac
