## ASSESSMENT ##

* The following use case might be a real-life example from one of our customers, please deliver your best possible solution. Please go through the described scenario and write a script, in one of the below languages, implementing a fix to the issue below. For the development of the scripts you have 4 hours and are allowed to use Google and any other material as long as the work submitted was written by you. 

* Use Case: 

- A database upgrade requires the execution of numbered scripts stored in a specified folder, e.g. SQL scripts such as 045.createtable.sql.
- There may be gaps in the numbering and there isn't always a . (dot) after the number. 
- The database upgrade is based on looking up the current version in the database and comparing this number to the numbers in the script names. 
- If the version number from the db matches the highest number from the script then nothing is executed. 
- If the number from the db is lower than the highest number from the scripts, then all scripts that contain a higher number than the db will be executed against the database. 
- In addition, the database version table is updated after the install with the highest number. 

  

* Requirements:

- Supported Languages: Bash, Python2.7, PHP, Shell, Ruby, Powershell - No other languages will be accepted
- The table where the version is stored is called 'versionTable', and the row with the version is 'version'. This table contains only one column with the actual version.
- You will have to use a MySQL database
- The information about the database and the directory will be passed through arguments, following this format
  <directory with .sql scripts> <username for the DB> <DB host> <DB name> <DB password> :
 

### Briefing ###
* This is just a test repository with some scripts

### Index ###
```
.
├── mysql-updatetables1_2.sh
├── mysql-updatetables.sh
└── README.md
```

### RELEASES ###
* mysql-updatetables.sh
```
OUTPUT EX:
mysql: [Warning] Using a password on the command line interface can be insecure.
the script 043.createtable.sql won't be executed
mysql: [Warning] Using a password on the command line interface can be insecure.
the script 045.createtable.sql won't be executed
mysql: [Warning] Using a password on the command line interface can be insecure.
the script 049.createtable.sql won't be executed
...
```

* mysql-updatetables1_2.sh
- New Backend secure login archiving client credentials under ~/.my.cfn
```
~$ cat .my.cnf
[client]
user=
password=
host=
```
- No Output login warning updating the mysql CL using .my.cfn
```
OUTPUT EX:
the script 043.createtable.sql won't be executed
the script 045.createtable.sql won't be executed
the script 049.createtable.sql won't be executed
the script 051createtable.sql won't be executed
the script 74e.createtable.sql won't be executed
...
```

### ETC ###
![Alt text](https://i0.wp.com/farm5.staticflickr.com/4327/36248622776_56cfc99530_n.jpg?resize=525%2C289&ssl=1 "MySQL Logo")

