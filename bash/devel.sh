# This file must not be executable.
#
# To use that functions and aliases, put next line in your .bashrc:
#   source /usr/share/arco-tools/devel.sh

alias fmake='while [ 1 ]; do make; echo DONE:$?; inotifywait -qr -e MODIFY . || break; done;'
