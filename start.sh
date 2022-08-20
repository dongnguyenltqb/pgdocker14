#!/bin/bash
set -e
if [[ $(whoami) != "postgres" ]]; then
	echo "Please run as postgres user";
	exit 1;
fi
# check empty dir and run init db
if [[ $(ls /usr/local/pgsql/data) == "" ]]; then
    # init with password
    PG_PASSWORD=${PG_PASSWORD:-postgres}
    echo $PG_PASSWORD > /home/postgres/password.txt
    /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data --auth-host=md5 -A md5 --pwfile=/home/postgres/password.txt
    # enable remote host access
    echo "host    all       all     0.0.0.0/0       md5" >> /usr/local/pgsql/data/pg_hba.conf
    # enable replication
    echo "host    replication       all     0.0.0.0/0       md5" >> /usr/local/pgsql/data/pg_hba.conf
fi
/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data -r /usr/local/pgsql/data/output.log -h 0.0.0.0
