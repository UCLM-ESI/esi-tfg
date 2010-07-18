#!/bin/bash
MAIN=${1:-main.tex}
echo $MAIN
grep "\\input{" $MAIN | grep -v "^%" | awk -F{ '{print $2}' | awk -F} '{print $1}'
