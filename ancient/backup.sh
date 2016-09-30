#!/bin/sh
function header(){
	echo `date +[%F:%T]`
}
function message(){
	echo "`header` $1"
}
datestring=`date +%F_%T`
basedir=/home/guest/Documents/Eclipse
tar cf /home/guest/Documents/Backups/backup$datestring.tar.gz $basedir --exclude="$basedir/.metadata" --exclude="$basedir/Testing"
message "Backup successful, filename: backup$datestring.tar.gz"


#Find oldest file
while [ `ls -l /home/guest/Documents/Backups/ | wc -l` -gt 10 ]; do
	oldestFile=`find /home/guest/Documents/Backups/ -type f -printf '%T+ %p\n' | sort | head -n 1 | awk -F ' ' '{print $2}'`
	rm $oldestFile
	message "The oldest file was: $oldestFile"
done
