linux has users which helps in giving permissions to people for their required resources
linux has root user which is the user with the most privilege in linux
using root we can create more users and give them limited permissions to the folders

if we install postgre sql it automatically creates a user postgresql, which helps it to only 
run stuff related to postgresql. this way a user cannot accidentally delete files 
and if any vulnerability comes to the system, it does not get access to the files except the data


/etc/passwd contains all the info related to the users you can see all the info using cat /etc/passwd
for each user, it has 7 fields separated by ':' which is just a separator.
each field contains inforamtion like the username, password, UID, location, etc.


in linux we have 3 kinds of users
1. root: with the most privilages
2. user: this is created by the root user and is given limited permissions
3. daemon: it is the user that is not actually a user but works on the background and runs some stuff and services
              daemon has /usr/sbin/nologin which prevents any other user to login as daemon
4. nobody (UID: 65534) is the user with least privileges and has access to almost nothing used mostly for NFS (Network file system) 

principle of least privilege in linux means, that the users in the server must be given only the least privilege which are 
required and nothing more than that
if any unauthorised user gets the privileges for folders which were not supposed to be given, can be misused 
thats why no database or anything is ran on the root cause if the attacker gets the access to the root they will have access to the db

$ id
uid=1000(saksham) gid=1000(saksham) groups=1000(saksham),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),100(users),105(lpadmin),125(sambashare)

this gives the userid of the current user and also the name 


sudo → can run commands as root
adm  → can read system logs in /var/log







