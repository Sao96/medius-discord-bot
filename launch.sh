#!/bin/bash

INIT_MEM="256m"
MAX_MEM="512m"
JAR="medius-discord-bot.jar"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f "${DIR}/${JAR}" ]; then
	echo -e "$(tput bold)$(tput setaf 1)The jar file ${JAR} does not exist! Run ./build.sh first.$(tput sgr0)"
	exit 1
fi

if ! command -v java &> /dev/null; then
    echo -e "$(tput bold)$(tput setaf 1)Java is not installed, please install java!$(tput sgr0)"
    exit 1
fi

java -server -XX:+UseG1GC -Xms${INIT_MEM} -Xmx${MAX_MEM} -jar ${DIR}/${JAR} config.json

# Fix coloring
echo -e "$(tput sgr0)"
