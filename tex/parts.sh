#!/bin/bash
grep input $1 | grep -v "^%" | awk -F{ '{print $2}' | awk -F} '{print $1}'
