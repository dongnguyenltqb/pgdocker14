#!/bin/bash
if ! [[ $1 && $2 ]]; then 
    echo "require host/port to create backend"
    exit 1
fi
./pg_basebackup -D /backup -F t -P -v -U replicator -X stream -w


