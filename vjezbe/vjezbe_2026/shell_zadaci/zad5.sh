#!/bin/bash

if [ $(($# % 2 )) -ne 0 ]
then
	echo "Potrebno je predati paran broj argumenata"
	exit 1
fi

while [ $# -gt 0 ]
do
	if ! [ -f "$1" ] 
	then
		echo "$1 nije fajl"
	elif ! cp "$1" "$2" 
	then
		echo "Nije uspjelo kopiranje $1 u $2"
	fi
	
	shift
	shift
done
