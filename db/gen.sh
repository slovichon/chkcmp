#!/bin/sh

if [ $# -lt 2 ]; then
	echo "usage: $0 target chksum1 [chksum2 [... [chksumN]]]"
	exit 1
fi

target=$1
shift

output=$(echo $target | sed 's!/!_!g')

chksums=$*

for i in $target/*; do
	for chksum in $chksums; do
		$chksum $i >> $output.$chksum
	done
done

exit 0
