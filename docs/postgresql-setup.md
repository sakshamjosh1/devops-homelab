a postgresql database must have its own linux user, because it gives least privilege to the user and
the privilege of accessing the entire system in general.

postgresql allows connections from a similar linux user, so a postgres linux user connects as postgres 
database user. this is called peer authentication.

homelab_db was created so that the db of this application can be isolated with other databases and
projects so everything runs independently.
homelab_user was specifically created for this database and was given all privileges to this particular 
user as we should never run a database as postgres because of the concept of least privilege, which 
makes the db more secure


