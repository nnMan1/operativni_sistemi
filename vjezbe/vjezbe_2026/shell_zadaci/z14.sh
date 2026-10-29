if ! [ -f "muzika.txt" ]
then
	> "muzika.txt"
fi

opcije="Obrisi Dodaj Izmijeni Izlistaj Kraj"
select op in $opcije;
do
	if [ "$op" = "Obrisi" ]
	then
		echo "Unesite ID CD-a koji zelite da obrisete"
		read id
		
		grep -v -E "^$id" "muzika.txt" > "tmp.txt"
		mv "tmp.txt" "muzika.txt"
		
	elif [ "$op" = "Izlistaj" ]
	then
		cat "muzika.txt"
	elif [ "$op" = "Dodaj" ]
	then
		if [ -s "muzika.txt" ]
		then
			if=1
		else
			muzika_sort=$(sort -n -r -k1 "muzika.txt")
			muzika_sort=($muzika_sort)
			id=${muzika_sort[0]}
			id=$(($id + 1))
		fi
		
		echo "Unesite naslov"
		read naslov
		echo "Unesite izvodjaca"
		read izvodjac
		echo "Unesite vrstu"
		read vrsta
		
		echo "$id $naslov#$izvodjac#$vrsta" >> "muzika.txt" 
	elif [ "$op" = "Izmijeni" ]
	then 
		echo "Unesite ID CD-a koji zelite da izmijenite"
		read id
		
		grep -v -E "^$id" "muzika.txt" > "tmp.txt"
		mv "tmp.txt" "muzika.txt"
		
		echo "Unesite naslov"
		read naslov
		echo "Unesite izvodjaca"
		read izvodjac
		echo "Unesite vrstu"
		read vrsta
		
		echo "$id $naslov#$izvodjac#$vrsta" >> "muzika.txt" 		
		
	elif [ "$op" = "Kraj" ]
	then
		echo Kraj.
		break
	else
		clear
		echo Opcija ne postoji.
	fi
done
