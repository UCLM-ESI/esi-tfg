#!/bin/bash

function parts() {
    for f in $(grep "\\input{" $1 | grep -v "^%" | awk -F{ '{print $2}' | awk -F} '{print $1}'); do
         echo $f
	 parts $f
    done
}


MAIN=${1:-main.tex}
echo $MAIN
parts $MAIN
