# This file must not be executable.
#
# To use that functions and aliases, put next line in your .bashrc:
#   source /usr/share/arco-tools/devel.sh

function iexec() {
	cmd=$*

	while [ 1 ]; do
		$cmd
		retval=$?

		echo DONE:$retval

		if type notify-send > /dev/null; then
			if [ $retval -eq 0 ]; then
				icon='gtk-yes'
			else
				icon='gtk-no'
			fi
			notify-send -t 2000 -i $icon "fmake: $retval" "$ $cmd"
		fi
		inotifywait -qr -e MODIFY . || break
		sync
		sleep 0.5
	done
}

alias imake='iexec make'
