#!/bin/bash

#autofs初期で入ってない

function confInstall
{
	/etc/init.d/autofs start ||:

	install -o root -g root -m 644 -b auto.home auto.master auto.misc auto.net auto.smb /etc

	[ -d /ahome/ ] || mkdir /ahome
	
	[ -h /home/hera ]  || ln -sf /ahome/hera  /home/hera
	[ -h /home/public ] || ln -sf /ahome/public /home/public
	#[ -h /home/datlib ] || ln -sf /ahome/datlib   /home/datlib
	[ -h /home/zeus ]   || ln -sf /ahome/zeus   /home/zeus

	/etc/init.d/autofs stop ||:
}


[ ${HOSTNAME%%.*} = "hera" ] && exit
[ ${HOSTNAME%%.*} = "zeus" ] && exit

confInstall

exit
