#!/bin/bash
df | awk 'NR==2{
    Disk_use=$5
    sub(/%/,"",Disk_use)
    if(Disk_use<85)
        printf("Disk-Root %d%% OK\n",Disk_use)
    else
        printf("Disk-Root %d%% Alert\n",Disk_use)
}'

free | awk '/Mem/{
    Mem_use=($3/$2)*100
    if(Mem_use<90)
    	printf("Memory %.1f%% OK\n",Mem_use)
    else
    	printf("Memory %.1f%% Alert\n",Mem_use)    	
}'

top -n 1 | awk 'NR==1{
	Load=$12
    sub(/,/,"",Load)
    Load=Load/4
    if(Load<0.7)
    	printf("Loadaverage %.2f OK\n",Load)
    else
    	printf("Loadaverage %.2f Alert\n",Load)
}'