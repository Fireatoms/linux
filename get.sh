#!/bin/bash
check_null_num(){
	re='^[0-9]+$'
	if [[ -z $1 ]];then
		echo "you input none" 
		exit 1
	elif ! [[ $1 =~ $re ]];then
		echo "you input wrong format" && exit 1
	fi
}

check_null_num $1

port=$1
port_stream=$(netstat -lunatp | grep -w $port)

if [[ -z $port_stream ]];then
	echo "OFF"
else
	progress_name=$(echo $port_stream | awk -F/ '{print $2}' | uniq)
	if [[ -z progress_name ]];then
		echo "Can't get the process name"
	else
		echo $(which $progress_name)
	fi
fi	
