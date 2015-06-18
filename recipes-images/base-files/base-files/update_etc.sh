#!/bin/sh
if [ -f /var/update/.newimage ];then
	if [ -e GIT_URL ];then
		if [ ! -e /etc/gitconfig ];then
			git config --system user.name "GIT_USER"
			git config --system user.email "GIT_MAIL"
			git config --system core.editor "nano"
			git config --system http.sslverify false
		fi
		cd GIT_URL && git log -p -1 | grep "initial commit" && exit
		cd /etc && etckeeper init
		git remote add origin GIT_URL
		git fetch -a
		git reset --hard origin/master
		rm /etc/ssh/ssh_host*
		rm /var/update/.newimage
		echo Reboot...
		sync
		sleep 2
		reboot -f
	fi
fi
