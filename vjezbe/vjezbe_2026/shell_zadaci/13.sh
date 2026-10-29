if [ $# -lt 1 ]
then
	echo Manje od 2 arg!
	exit 1
fi

while [ $# -ne 0 ]
do
	if [ $1 -eq $1 ]
	then
		echo $1 >> argp.txt
	fi
	shift
done

sort < argp.txt > arg.txt
rm argp.txt