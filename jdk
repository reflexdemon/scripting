#!/usr/bin/env bash

# This will require to be executed on an elevated sudo level user

function printUsage() {
	MESSAGE=$1
	echo -e "\e[39m"
	echo -e "Error: \e[31m${MESSAGE}"
	echo -e "\e[39m"
	update-alternatives --list java | grep adopt
	echo -e "\e[39m"
	echo "For Example:"
    echo "To switch to JDK 11 use ${0} 11"
}

error() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
  printUsage "Permission issue"
}

if [ "$EUID" -ne 0 ]
  then error "Please run as root: $ sudo ${0}"
  exit 1
fi

JDK=$1

if [ "$#" -eq  "0" ]
   then
     printUsage "No arguments supplied. Please use one of the below available alternatives version"
     exit 1
 else
     echo "Requested JDK is $JDK"
 fi


# /usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/bin/java
# /usr/lib/jvm/adoptopenjdk-13-hotspot-amd64/bin/java
# /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/java

PATH_BASE="/usr/lib/jvm/adoptopenjdk-${JDK}-hotspot-amd64/bin"


CHECK_JAVA=$PATH_BASE/java
if [ ! -f "$CHECK_JAVA" ]
then
    printUsage "Requested JDK $JDK has not been installed. Please try to install using\n \$ sudo apt-get install adoptopenjdk-${JDK}-hotspot"
    exit 2
fi

# Log gile location useful for debugging
LOG_FILE=/tmp/.jdk_alternatives.log

#Common tools that is used frequently
COMMANDLIST="jaotc
jar
jarsigner
java
javac
javadoc
javap
jcmd
jconsole
jdb
jdeprscan
jdeps
jhsdb
jimage
jinfo
jlink
jmap
jmod
jps
jrunscript
jshell
jstack
jstat
jstatd
rmic
serialver"


rm -f $LOG_FILE
for command in ${COMMANDLIST}
do
	echo "Setting $command to ${PATH_BASE}/$command" >>$LOG_FILE
	sudo update-alternatives --set "$command" "${PATH_BASE}/$command" >>$LOG_FILE
done

java -version
javac -version
