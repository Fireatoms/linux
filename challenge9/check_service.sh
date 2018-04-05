#!/bin/bash
if [[ $1 ]]
then
    sudo service $1 status | grep 'stopped'
    if [[ $? == 0 ]]
    then
        sudo service mysql start
        echo "Restarting"
    else
        sudo service $1 status | grep 'unrecognized'
        if [[ $? == 0 ]]
        then
            echo "Error: Service Not Found"
        else
            echo "is Running"
        fi
    fi
else
    echo "Error: You have not input service"
fi
