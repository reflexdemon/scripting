#!/bin/bash


#URL=$1
FILE_NAME=test.wsdl


for ver in ${URL}
do
	curl $ver >$FILE_NAME
	#wc -c <  $FILE_NAME
	#ls -lah $FILE_NAME | awk '{ print $5}'
	s1=$(wc -c < $FILE_NAME)
	s2=$(ls -lah $FILE_NAME | awk '{ print $5}')

	rm -f $FILE_NAME
	echo Size is $s1 bytes
	if [ "$s1" -le 0 ]; then
		echo Test Failed.
		exit 1;
	else
		echo Test Passed  $s2 data downloaded.
		exit 0;
	fi
done