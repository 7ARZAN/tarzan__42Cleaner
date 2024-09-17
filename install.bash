#!/bin/bash
#Author : El housseine Lakhfif
#42login : elakhfif

startInstall(){
	printf "\nLoading... \n"
	path=$(pwd)
	tarzanPath="$(pwd)/cleaner.bash"
	alreadyInstall=$(grep "####10108tarzanCLNNR10108####" ~/.zshrc)
	if [ ${#alreadyInstall} == 0 ]then
		echo $'\n\n\n####10108tarzanCLNNR10108####' >> ~/.zshrc
		echo "alias storage=\"bash $path/check_space.bash\"" >> ~/.zshrc
		echo "alias tarzan=\"bash $path/help.bash\"" >> ~/.zshrc
		echo "alias untarzan=\"bash $path/untar.bash\"" >> ~/.zshrc
		echo "alias bdocker=\"bash $path/init_docker.bash\"" >> ~/.zshrc
		echo "alias clean=\"bash $tarzanPath\"" >> ~/.zshrc
		echo "alias cleanfull=\"bash $path/cleanAllAppsData.bash\"" >> ~/.zshrc
        
		if [ "$1" == '1' ]then
			echo "/bin/bash $tarzanPath" >> ~/.zshrc
		fi
		echo "####10108tarzanCLNNR10108####" >> ~/.zshrc
		printf "\033[32mInstalled ✅ \033[0m\n"
		printf "\n\n\033[0;31m[!] \033[0;33mPlease restart your terminal to apply changes or run \033[0;32msource ~/.zshrc \033[0m\n\n"
	else
		printf "\033[32mAlready installed!✅ \033[0m\n\n"
	fi
}


echo "\033[33m
	┌┬┐┌─┐┬─┐┌─┐┌─┐┌┐┌
	 │ ├─┤├┬┘┌─┘├─┤│││
	 ┴ ┴ ┴┴└─└─┘┴ ┴┘└┘
         Created by \033[0;32m7ARZAN
\033[0m";

printf "\033[0;36m[1] \033[0;33mFull install (install and run whenever you open terminal)\n\033[0;36m[2] \033[0;33mJust install (run tarzan as a command) \033[0m\n\n \033[0;36m─➤ "

read -p "" var

if [ "$var" == '1' ]
then
	startInstall '1';
fi

if [ "$var" == '2' ]
then
	startInstall;
fi
