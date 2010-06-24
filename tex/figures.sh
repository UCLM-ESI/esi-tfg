#!/bin/bash

FIGPATH=$1/figures

grep -v "^%" $1/*.tex | grep includegraphics \
    | sed "s/.*includegraphics\[.*\]{\([.a-zA-Z0-9_-//]*\).*$/\1/g" \
    | sort | uniq
