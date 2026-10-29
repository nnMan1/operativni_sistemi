#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Potrebno je predati jedan argument"
	exit 1
fi

#if ! [ $1 -eq $1 2>/dev/null ] 
if ! [[ $1 =~ ^[+-]?[0-9]+$ ]]
then
	echo "Potrebno je predati cio broj"
	exit 1
fi

i=1
while [ $((i*i + i*i*i)) -le $1 ]
do
	i=$((i+1))
done

echo "Rjesenje je $i"
