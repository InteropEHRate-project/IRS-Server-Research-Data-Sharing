# InteropEHRate IRS Server Research Data Sharing


This repository stores the two components relative to the InteropEHRate Research Protocol server side.

The Central Node web portal, and the Research Centre (RC) application.

## Central Node

The Central Node web portal component, stored in "RDS/central node/login-upload/", is developed in NodeJS, due to that a NodeJS environment has to be available in the deploy machine.

It requires a previous set up of a postgresql database, which needs to be initialized with the sql file "RDS/central-node/psql-db/central-node.sql". It is possible to set up the database connection by editing the file "RDS/central node/login-upload/config.js".

For PostgreSQL documentation refer to https://www.postgresql.org/docs/

To run the Central Node web portal, you need to go in "RDS/central node/login-upload/" and run the following command:

#node index.js

The file "RDS/central node/login-upload/config.js" contains the host and port values for the Central Node web portal. they can be changed if not suitable in the deploy machine. 
