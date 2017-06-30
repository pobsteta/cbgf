#!/bin/bash
set -e

if [ "$REP" ]; then
    cd /data/restore
    wget --no-check-certificate https://pascalobstetar.cozycloud.cc/public/files/files/$REP/attach/tryton.sql.gz
fi
