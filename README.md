# InteropEHRate IRS Server Research Data Sharing


This repository stores the two components relative to the InteropEHRate Research Protocol server side.

The Central Node web portal, and the Research Centre (RC) application.

## Central Node

The Central Node web portal component, stored in "RDS/central node/login-upload/", is developed in NodeJS, due to that a NodeJS environment has to be available in the deployment machine.

It requires a previous set up of a postgresql database, which needs to be initialized with the sql file "RDS/central-node/psql-db/central-node.sql". It is possible to set up the database connection by editing the file "RDS/central node/login-upload/config.js".

For PostgreSQL documentation refer to https://www.postgresql.org/docs/

To run the Central Node web portal, you need to go in "RDS/central node/login-upload/" and run the following command:

#node index.js

The file "RDS/central node/login-upload/config.js" contains the host and port values for the Central Node web portal. they can be changed if not suitable in the deployment machine. 

## Research Centre

The RC application, stored in "RDS/RC/", is developed in Java, but for installation purpose a docker image of this application is provided in "docker-images/rc-3-3.tar.gz".

For this reason a docker and docker-compose environments are required to run the RC application.

In order to run the application, you need to go in "RDS/RC/", where the docker-compose.yml file is present, and run the following command:

#docker-compose up

Be sure that the image name specified for the "research" container, in the docker-compose.yml file, is the same as the docker image you uploaded in the deployment machine.



To receive more support for download and installation of this components, contact simone.bocca@unitn.it, gabor.bella@unitn.it


