#!/bin/bash

grep -v "^%" $TEX_SRC_DIR/*.tex | grep includegraphics \
    | sed "s/.*includegraphics\[.*\]{\([.a-zA-Z0-9_-//]*\).*$/\1/g" \
    | sort | uniq
