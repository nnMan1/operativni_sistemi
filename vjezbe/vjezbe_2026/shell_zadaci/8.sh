#primjer poziva: ./8.sh p a "*.t" ovaj skup fajlova mora pod "" !!!!!!!
if [ $# -lt 3 ]
then
	echo Neispravan broj argumenata!
	exit 1
fi
echo $3
if [ "$1" = "p" ]
then
	for f in $3;
	do
		folder=`dirname $f`
		fajl=`basename $f`

		mv $f "$folder/$2$fajl"
	done
elif [ "$1" = "s" ]
then
	for f in $3;
	do
		folder=`dirname $f`
		fajl=`basename $f`

		mv $f "$folder/$fajl$2"
	done
else
	echo Neispravno!
	exit 2
fi
