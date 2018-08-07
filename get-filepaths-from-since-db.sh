#!/bin/bash
SOURCE=$2
while IFS='' read -r line || [[ -n "$line" ]]; do
#    echo "Text read from file: $line"
    INODE=$(echo "$line" | cut -d' ' -f 1)
    FILE=$(debugfs -R "ncheck $INODE" $SOURCE /dev/vda1 >&1 2>/dev/null | grep $INODE)
    echo "$INODE: $FILE"
done < "$1"
