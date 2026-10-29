#!/bin/bash

if [ $# -ne 1 ] 
then
	echo "Potrebno je predati putanju do direktorijuma"
	exit 1
fi

if ! [ -d $1 ]
then
	echo "Predata putanja ne predstavlja direktorijum"
	exit 1
fi

for f in "$1"/*
do
	ime=$(basename $f)
	direktorijum=$(dirname $f)
	echo $f $ime $direktorijum
done
