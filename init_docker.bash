#!/usr/bin/env bash

# Ensure USER variable is set
[ -z "${USER}" ] && export USER=$(whoami)

# Config
docker_destination="/goinfre/$USER/docker"

# Colors
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
reset=$'\033[0;39m'

# Uninstall Docker components if installed via Homebrew
brew uninstall -f docker docker-compose docker-machine &>/dev/null ;:

# Check if Docker is installed and prompt user to install if not
if [ ! -d "/Applications/Docker.app" ]; then
    echo "${blue}Please install ${cyan}Docker for Mac ${blue}from the MSC (Managed Software Center)${reset}"
    open -a "Managed Software Center"
    read -n1 -p "${blue}Press RETURN when you have successfully installed ${cyan}Docker for Mac${blue}...${reset}"
    echo ""
fi

# Kill Docker if it is running
if [ -d "/Applications/Docker.app" ]; then
    killall Docker &>/dev/null ;:
fi

# Handle existing docker destination
if [ -d "$docker_destination" ]; then
    read -n1 -p "${blue}Folder ${cyan}$docker_destination${blue} already exists, do you want to reset it? [${cyan}Y${blue}/${cyan}N${blue}]${reset} " input
    echo ""
    if [ "$input" = "y" ]; then
        rm -rf "$docker_destination"/{com.docker.{docker,helper},.docker} &>/dev/null ;:
    fi
fi

# Unlink and remove existing Docker directories and symlinks
unlink ~/Library/Containers/com.docker.docker &>/dev/null ;:
unlink ~/Library/Containers/com.docker.helper &>/dev/null ;:
unlink ~/.docker &>/dev/null ;:
rm -rf ~/Library/Containers/com.docker.{docker,helper} ~/.docker &>/dev/null ;:

# Create directories and symlinks
mkdir -p "$docker_destination"/{com.docker.{docker,helper},.docker}
ln -sf "$docker_destination"/com.docker.docker ~/Library/Containers/com.docker.docker
ln -sf "$docker_destination"/com.docker.helper ~/Library/Containers/com.docker.helper
ln -sf "$docker_destination"/.docker ~/.docker

# Start Docker for Mac
open -g -a Docker

echo "${cyan}Docker${blue} is now starting!${reset}"

