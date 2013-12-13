#!/bin/bash


URL=$1
FILE_NAME=test.wsdl

#stat -c %s $FILE_NAME
curl $URL >$FILE_NAME
s=$(ls -lah $FILE_NAME | awk '{ print $5}')

rm -f $FILE_NAME
echo Size is $s
