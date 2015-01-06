#!/bin/bash
umask 000

chown -R nobody:users /opt/couchpotato /config

exec /sbin/setuser nobody python /opt/couchpotato/CouchPotato.py --config_file=/config/config.ini --data_dir=/config/data