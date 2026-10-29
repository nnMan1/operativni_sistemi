#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Potrebno je predati putanju do direktorijuma"
	exit 1
fi

if -d [ -d $1 ]
then
	echo "Predata putanja ne predstavlja direktorijum"
	exit 2
fi

for f in "$1"/*
do
	if [ -f $f ] 
	then
		velicina=$(stat -c "%s" "$f")
		velicina=$(wc -c < "$f")
		echo $f $velicina
	fi
done
