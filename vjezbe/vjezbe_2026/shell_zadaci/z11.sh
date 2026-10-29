read n

if [ $n -le 0 ]
then
	echo $n nije prirodan broj!
	exit 1
fi

i=$n

while [ $i -gt 0 ]
do
	ostatak=`expr $n \% $i`
	if [ $ostatak -eq 0 ]
	then
		echo $i >> djelioci.txt
	fi
	i=`expr $i \- 1`
done
