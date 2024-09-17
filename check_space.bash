#!/bin/bash
#Author : El housseine Lakhfif
#42login : elakhfif

check_storage(){
	Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')

	if [ "$Storage" == "0BB" ];then
		Storage="0B"
	fi

	printf "\n\n\033[32m [ Available storage :  $Storage  ]\n\033[0m\n\n"

	if [ "$Storage" == "0B" ];then
		printf "\033[31m [ WARNING ] : No more storage available\n\033[0m\n"
	fi
}

check_storage;
