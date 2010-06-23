#!/bin/bash

if [ $# -eq 0 ]; then
    echo "gnesis-upload <deb_files>"
    exit 1
fi

# ARCH=${3:-i386}

scp $* babel.esi.uclm.es:/var/gnesisrepo/dists/unstable/main/binary-i386/
echo "Copying to: /var/gnesisrepo/dists/unstable/main/binary-i386/"
ssh babel.esi.uclm.es "cd /var/gnesisrepo && ./update-archive.sh"
