#!/bin/bash

# Security improvements. Credentials been moved in a secure location
# Output improved avoding unsecure login warning

### VARIABLES ###
SCRIPTDIR=/tmp/updating-scripts

### UPGRADING DB ###
### for cycle is to set as varialbe all the file in the given directory ###
for i in $(ls -l $SCRIPTDIR | grep -v total | awk '{ print $9 }') ; do
	### LASTVERSION is storing the last version ###
	LASTVERSION=`mysql -s -N -e "select version from ecs.versionTable"`
	### The versioning will take just the numbers in the first 3 characters
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
		mysql < ${SCRIPTDIR}/${i}
		echo "$VERSIONING APPLIED"
		### the following update will "update" the db version ###
		mysql -e "update ecs.versionTable SET version='$VERSIONING' where version ='$LASTVERSION'"
		echo "VersionTable updated. Current version is: $VERSIONING"
	fi
done
