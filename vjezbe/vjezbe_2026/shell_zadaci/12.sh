if [ $# -lt 2 ]
then
	echo Manje od 2 arg!
	exit 1
fi

if ! [ $1 -eq $1 ]
then
	echo $1 nije broj
	exit 2
fi

if ! [ $2 -eq $2 ]
then
	echo $2 nije broj
	exit 2
fi

a=$1
b=$2

while [ $b -ne 0 ]
do
	ostatak=`expr $a \% $b`
	a=$b
	b=$ostatak
done

echo $a