#!/bin/bash
# -*- coding:utf-8 -*-

if [ $# -eq 0 ]; then
    echo "$0 <path_to_dir> [changelog_entry]"
    exit 1
fi

DEBFULLNAME="ARCO Research Group"
DEBEMAIL="sysadm@arco.esi.uclm.es"

cd $1

dch -i $2
