#!/bin/bash
MAIN=${1:-main.xml}
grep -v "^%" $(dirname $MAIN)/*.xml | grep "<imagedata" \
    | sed "s/.*<imagedata.*fileref=\"\(.*\)\"\/>.*$/\1/g" \
    | sort | uniq
