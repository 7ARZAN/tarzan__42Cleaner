#!/bin/bash
#Author : El housseine Lakhfif
#42login : elakhfif

function	deleteService(){
	shouldRemove='0' $1

	while read -r line
	do
		if [[ ! $line =~ $1 ]]
		then
			if [ $shouldRemove == '0' ]
			then
				echo "$line"
			fi
		else
			if [ $shouldRemove == '0' ]
			then
				shouldRemove='1'
			elif [ $shouldRemove == '1' ]
			then
				shouldRemove='0'
			fi
		fi
	done < ~/.zshrc > O1234567899876543210Darkmode

	$(cat O1234567899876543210Darkmode > ~/.zshrc)
	$(rm -rf O1234567899876543210Darkmode)
}

if [ "$1" == "active" ]
then
	if [ "$2" == "dark-mode" ]
	then
		alreadyInstall=$(grep "####10108tarzan-Dark-mode10108####" < ~/.zshrc)
		if [  ${#alreadyInstall} == 0 ]
		then
			$(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true')
			echo -e "\n####10108tarzan-Dark-mode10108####" >> ~/.zshrc
			echo -e "osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to true'" >> ~/.zshrc
			echo -e "####10108tarzan-Dark-mode10108####" >> ~/.zshrc
			printf "\n\033[32mDark-mode activated ✅ \033[0m\n\n"
		else
			printf "\n\033[0;31mDark-mode is already activated!\033[0m\n\n"
		fi
	fi
	if [ "$2" == "code" ]
	then
		alreadyInstall=$(grep "####10108tarzan-code10108####" < ~/.zshrc)
		if [  ${#alreadyInstall} == 0 ]
		then
			echo -e "\n####10108tarzan-code10108####" >> ~/.zshrc
			echo -e "alias code=\"/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/./code\"" >> ~/.zshrc
			echo -e "####10108tarzan-code10108####" >> ~/.zshrc
			printf "\n\033[32mcode command activated ✅ \033[0m"
			printf "\033[0;31m: you need to reopen your terminal to apply the new changes.\033[0m\n\n"
		else
			printf "\n\033[0;31mcode command is already activated!\033[0m\n\n"
		fi
	fi
elif [ "$1" == "deactivate" ]
then
	if [ "$2" == "dark-mode" ]
	then
		alreadyInstall=$(grep "####10108tarzan-Dark-mode10108####" < ~/.zshrc)
		if [  ${#alreadyInstall} == 0 ]
		then
			printf "\n\033[0;31mDark-mode is not activated!\033[0m\n\n"
		else
			$(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false')
			deleteService "####10108tarzan-Dark-mode10108####"
			printf "\n\033[32mDark-mode deactivated ✅ \033[0m\n\n"
		fi
	fi

	if [ "$2" == "code" ]
	then
		alreadyInstall=$(grep "####10108tarzan-code10108####" < ~/.zshrc)
		if [  ${#alreadyInstall} == 0 ]
		then
			printf "\n\033[0;31mcode command is not activated!\033[0m\n\n"
		else
			deleteService "####10108tarzan-code10108####"
			printf "\n\033[32mcode command deactivated ✅ \033[0m"
			printf "\033[0;31m: You need to reopen your terminal to apply the new changes.\033[0m or run \033[0;32msource ~/.zshrc\033[0m\n\n"
		fi
	fi
else
	echo -e "\033[33m
		┌┬┐┌─┐┬─┐┌─┐┌─┐┌┐┌
		 │ ├─┤├┬┘┌─┘├─┤│││
		 ┴ ┴ ┴┴└─└─┘┴ ┴┘└┘
		Created by \033[0;32m7ARZAN\033[0;33m\033[0m"

		printf "\n\033[0;33mtarzan will always run when you open the terminal, you don't need to do anything.\033[0m"
		printf "\n\n\033[0;35m------- Command line you can run -------\033[0m\n\n"
		printf "|- To clean your computer: \033[4;36mclean\n\n\033[0m"
		printf "|- To run docker: \033[4;36mbdocker [ Just CTRL+C if they ask for Password ]\n\n\033[0m"
		printf "|- To clean all the applications data in your computer: \033[4;36mcleanfull \033[0m \033[0;31m[WARNING] \033[0m\n\n"
		printf "|- To see your free space: \033[4;36mstorage\n\n\033[0m"
		printf "|- To Uninstall tarzan: \033[4;36muntarzan\n\n\033[0m"
		printf "|- To active dark-mode: \033[4;36mtarzan active dark-mode\n\n\033[0m"
		printf "|- To deactivate dark-mode: \033[4;36mtarzan deactivate dark-mode\n\n\033[0m"
		printf "|- To active \"code\" command (Vscode): \033[4;36mtarzan active code\n\n\033[0m"
		printf "|- To deactivate \"code\" command: \033[4;36mtarzan deactivate code\n\n\033[0m"
		printf "|- for help: \033[4;36mtarzan\n\n\033[0m"
		printf "\033[0;35m----------------------------------------\033[0m\n\n"
fi
