#!/bin/bash
MAIN=${1:-main.xml}
echo $MAIN
grep "<xi:include" $MAIN | awk -F'\"' '{print $2}'
