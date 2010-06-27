#!/bin/bash
MAIN=${1:-main.tex}
grep -v "^%" $(dirname $MAIN)/*.tex | grep includegraphics \
    | sed "s/.*includegraphics.*{\([.a-zA-Z0-9_-//]*\).*$/\1/g" \
    | sort | uniq
