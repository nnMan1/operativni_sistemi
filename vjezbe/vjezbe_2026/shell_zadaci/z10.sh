read n

if [ $n -lt 0 ]
then
	echo "$n < 0"
	exit 1
fi

if [ $n -eq 0 ]
then
	echo 1
else
	i=1
	fakt=1
	while [ $i -le $n ]
	do
		fakt=`expr $fakt \* $i`
		i=`expr $i \+ 1`
	done
	echo $fakt
fi
