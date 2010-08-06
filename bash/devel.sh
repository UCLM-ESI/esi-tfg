
# This file must not be executable.
#
# To use that functions and aliases, put next line in your .bashrc
#   source /usr/share/arco-tools/devel.sh


alias fmake='make; while inotifywait -r -e MODIFY .; do make; done;'
