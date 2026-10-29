read n

if [ $n -le 0 ]
then
	echo $n nije prirodan broj!
	exit 1
fi

i=1
kraj=0

while [ $kraj -eq 0 ]
do
	ikv=`expr $i \* $i`
	ikub=`expr $ikv \* $i`
	suma=`expr $ikv \+ $ikub`

	if [ $suma -gt $n ]
	then
		kraj=1
		echo Resenje je: $i
	else
		i=`expr $i \+ 1`
	fi
done
