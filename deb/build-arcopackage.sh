#!/bin/bash
# -*- coding:utf-8 -*-

if [ $# -eq 0 ]; then
    echo "$0 <path_to_dir>"
    exit 1
fi

DEBFULLNAME="ARCO Research Group"
DEBEMAIL="sysadm@arco.esi.uclm.es"

cd $1

dpkg-buildpackage -us -uc -rfakeroot

cd ..
echo "[INFO] Result package at '$(pwd)'"
