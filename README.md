## Note

1. Settings on the primary server
   ```
   wal_level 'replica'
   max_wal_senders
   max_connections
   wal_keep_segments
   wal_sender_timeout
   synchronous_standby_names
   synchronous_commit
   remote_apply
   ```
2. Settings on the standby server
   ```
   hot_standby 'on'
   wal_receiver_timeout
   standby_mode 'on'.
   primary_conninfo
   ```
3. Initialize standby node

   ```
   # backup entire primary data dir
   pg_basebackup -h remote_addr -p 5432 -D /home/postgres/backup -F t -P -v -U replicator -X stream -w

   # restore to data directory
   cp /home/postgres/backup/*.tar .
   tar -xvf base.tar
   tar -xvf pg_wall.tar

   cp /home/postgres/postgres.cfg .
   ```
