#!/bin/sh
# chkcmp - compares checksums on a list of files
# By Jared Yanovich <jaredy@closeedge.net>

# Usage information
usage()
{
	echo "Usage: chkcmp [options] file1 file2 ... fileN"
	echo "Options:"
	echo "	-h"
	echo "		Displays this help message"
	echo "	-t type"
	echo "		Use a specific checksum type"
	echo "	-l"
	echo "		List available checksum types"
	echo "	-d dir"
	echo "		Specify an alternative database root"
	echo "		(default: /usr/local/share/chkcmp)"

	exit 2
}

hasprog()
{
	prog=$1

	which "$1" | xargs ls

	# also try whereis and type

	return $?
}

# Set defaults
checksumtype=md5
dbroot=/usr/local/share/chkcmp
listchecksums=0

hasmd5=`hasprog md5`
hasrmd160=`hasprog rmd160`
hassha1=`hasprog sha1`
hascksum=`hasprog cksum`

# Process options
set -- `getopt hlt:d: $*`
if test $? != 0; then
	usage
fi
for i
do
	case "$i"
	in
 		-h)
			usage
			;;
 		-t)
 			checksumtype=$2
			shift
			shift
			;;
		-l)
			listchecksums=1
			shift
			;;
		-d)
			dbroot=$2
			shift
			shift
			;;
 		--)
 			shift
			break
			;;
 	esac
done

# Make sure we have some arguments
if [ "$#" = "0" ]; then
	usage
fi

# Determine system type
system=`uname -mrs | tr ' ' '-'`

if [ $listchecksums = "1" ]; then

	echo "Available checksums:"
	exit 0
else

fi

exit 0
