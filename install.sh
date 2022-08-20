#!/bin/bash
yum update -y
yum groupinstall -y "AWS Tools" "Development Tools" "buildsys-build"
yum install -y readline-devel systemd-devel
wget https://ftp.postgresql.org/pub/source/v14.5/postgresql-14.5.tar.gz
tar -xvf postgresql-14.5.tar.gz
cd postgresql-14.5
./configure --with-systemd
make
make install
adduser postgres
mkdir /usr/local/pgsql/data
chown -R postgres /usr/local/pgsql/data
