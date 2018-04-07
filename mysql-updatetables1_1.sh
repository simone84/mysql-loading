#!/bin/bash

### VARIABLES ###
SCRIPTDIR=/tmp/updating-scripts
DBNAME=ecs
DBUSER=ecs
DBPASS=password
DBHOST=localhost

### UPGRADING DB ###
### for cycle is to set as varialbe all the file in the given directory ###
for i in $(ls -l $SCRIPTDIR | grep -v total | awk '{ print $9 }') ; do
	### LASTVERSION is storing the last version ###
	LASTVERSION=$(mysql -u $DBUSER -p$DBPASS $DBNAME <<< 'select version from versionTable;' |grep -v version)
	### The script version 
	VERSIONING=$(echo $i | cut -c1-3 | sed 's/[^0-9]*//g')
	### if the db version is major or equal then the sql file do not execute it ###
	if [ "$LASTVERSION" -ge "$VERSIONING" ] ; then
		### this will print which sql script won't be executed ###
		echo "the script $i won't be executed"
	### otherwise run the sql script and update the db ###
	else
		### ths is to print out which sql script is actual running ###
		echo "the sql script $i is running"
		### the following command will upgrade tables ###
		mysql -u $DBUSER -p$DBPASS $DBNAME < ${SCRIPTDIR}/${i}
		echo "$VERSIONING APPLIED"
		### the following update will "update" the db version ###
		mysql -u $DBUSER -p$DBPASS $DBNAME <<< 'update versionTable SET version='$VERSIONING' where version ='$LASTVERSION';'
		echo "VersionTable updated. Current version is: $VERSIONING"
	fi
done
