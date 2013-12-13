#!/bin/bash


#URL=$1
FILE_NAME=test.wsdl

red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m' # No Color


for ver in ${URL}
do
	curl $URL >$FILE_NAME
	#wc -c <  $FILE_NAME
	#ls -lah $FILE_NAME | awk '{ print $5}'
	s1=$(wc -c < $FILE_NAME)
	s2=$(ls -lah $FILE_NAME | awk '{ print $5}')

	rm -f $FILE_NAME
	echo Size is $s1 bytes
	if [ "$s1" -le 0 ]; then
		echo -e "${red}Test Failed.{NC}"
	else
		echo -e "${red}Test Passed " + $s2 + " data downloaded.{NC}"
	fi
done
