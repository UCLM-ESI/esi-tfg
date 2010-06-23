#!/bin/bash
# -*- coding:utf-8 -*-

if [ $# -eq 0 ]; then
    echo "$0 <path_dir> <package_name> <package_version> [license]"
    exit 1
fi

if [ -d $1/debian ]; then
    echo "debian directory already exists at $1"
    exit 1
fi

DEBDIR=$1
COPYRIGHT=debian/copyright
CHANGELOG=debian/changelog

mkdir -p $DEBDIR

DEBFULLNAME="ARCO Research Group"
DEBEMAIL="sysadm@arco.esi.uclm.es"

export DEBFULLNAME
export DEBEMAIL

LICENSE=${4:-gpl3}

cd $DEBDIR

dh_make -p "$2_$3" -c $LICENSE --createorig

rm -f debian/*.ex debian/*.EX

function edit_ch {
    sed -i 's/ (Closes: #nnnn)  <nnnn is the bug number of your ITP>/./g' $CHANGELOG
    sed -i 's/<likewise for another author>//g' $CHANGELOG
}

function edit_cp {
    sed -i 's/(s)//g' $COPYRIGHT
    sed -i "s/<put author's name and email here>/<sysadm@arco.esi.uclm.es>/g" $COPYRIGHT
    sed -i 's/Firstname Lastname/ARCO Research Group/g' $COPYRIGHT
    sed -i "s/YYYY/$(date +%Y)/g" $COPYRIGHT
    sed -i 's/<likewise for another author>//g' $COPYRIGHT
    sed -i 's/<url:\/\/example.com>/http:\/\/arco.esi.uclm.es/g' $COPYRIGHT
}

edit_ch
edit_cp
