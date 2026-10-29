if ! [ -f $2 ]
then
	echo $2 nije fajl!
	exit 1
fi

i=1

while [ $i -lt $1 ]
do
	ikv=`expr $i \* $i`
	echo $ikv >> $2
	i=`expr $i \+ 1`
done
