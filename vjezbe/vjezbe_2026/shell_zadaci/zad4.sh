#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Potrebno je predati putanju do direktorjuma koji se backupuje"
	exit 1
fi

src="$1"
dest="$1/BACKUP"

if ! [ -d "$1" ]
then
	echo "Predati argurment nije folder"
	exit 1
fi

if [ $# -gt 1 ]
then
	if ! [ -d "$2" ]
	then
		echo "Drugi argument nije fileder"
		exit 1
	fi

	dest="$2"
else
	if ! [ -d "$dest" ]
	then
		mkdir "$dest"
	fi
fi


for a in "$src/"*.txt
do
	if [ -f $a ]
	then
		cp $a $dest
	fi
done

