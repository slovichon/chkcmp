#!/bin/sh

# XXX: sha2
chksums="md5 sha1 rmd160"
file=$(uname -srm | tr ' ' '-')

for i in /bin/* /usr/bin/* /usr/libexec/* /sbin/* /usr/sbin/*; do
	for chksum in md5 sha1 rmd160; do
		$chksum $i >> $file
	done
done

exit 0
