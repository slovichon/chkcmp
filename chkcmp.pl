#!/bin/sh
# $Id$

algorithms="md5 rmd160 sha1 sha2"

usage()
{
	echo "usage: $0 [-hlg] [-t type] [-d base] file ..."
	exit 2
}

hasprog()
{
	prog=$1

	which "$1" | xargs ls
	# XXX: also try whereis and type
	return $?
}

# Set defaults
checksumtype=md5
dbroot=/usr/local/share/chkcmp
listchecksums=0

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
