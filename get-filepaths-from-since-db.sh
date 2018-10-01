#!/bin/bash
SOURCE=$2
while IFS='' read -r line || [[ -n "$line" ]]; do
#    echo "Text read from file: $line"
    INODE=$(echo "$line" | cut -d' ' -f 1)
    FILE=$(debugfs -R "ncheck $INODE" $SOURCE /dev/vda1 >&1 2>/dev/null | grep $INODE)
    echo "$INODE: $FILE"
done < "$1"

#example: sh get-filepaths-from-since-db.sh /var/lib/logstash/.sincedb_6f594c2c64a2444a5dae74dfc2e1d1a2 /dev/vda1
