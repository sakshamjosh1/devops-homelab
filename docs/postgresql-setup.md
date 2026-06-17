a postgresql database must have its own linux user, because it gives least privilege to the user and
the privilege of accessing the entire system in general.

postgresql allows connections from a similar linux user, so a postgres linux user connects as postgres 
database user. this is called peer authentication.

homelab_db was created so that the db of this application can be isolated with other databases and
projects so everything runs independently.
homelab_user was specifically created for this database and was given all privileges to this particular 
user as we should never run a database as postgres because of the concept of least privilege, which 
makes the db more secure

pg_hba.confg file is a configuration file present inside /etc/postgresql.
it basically has the rules for accessing the database.
it has 5 columns: type (unix or local, host or TCP/IP n/w connection)
                      database: all (any database), homelab_db (specific database only)
                      user: all (any user), homelab_user (specific user only)
                      address: 127.0.0.1/32 - local host exactly, one IP
                                  10.42.0.0/16 - any IP in k3s pod network range
                                  blank - for local type (no address needed)
                       method: peer (for peer-to-peer authentication) match linux username to postgresql username, no password
                                  scram-sha-256 - password authentication using secure hashing


when ever anyone tries to access any database inside postgresql, it looks into this file, sees if the particular user can 
access this database, which database can this user access, if this particular ip can access the db.

the reason we created the homelab_db was to isolate this particular database for homelab from other databases
the homelab_user was given the privilege to only access the homelab_db
we scoped the homelab_user to access the database from the k3s pod

the 10.42.0.0/16 refers to the k3s pod, it allows all sorts of k3s network ips to talk to the database
