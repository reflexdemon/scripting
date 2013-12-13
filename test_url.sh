#!/bin/bash


#URL=$1
FILE_NAME=test.wsdl


for ver in ${URL}
do
	curl $URL >$FILE_NAME
	#wc -c <  $FILE_NAME
	#ls -lah $FILE_NAME | awk '{ print $5}'
	s=$(wc -c < $FILE_NAME)

	rm -f $FILE_NAME
	echo Size is $s
done
