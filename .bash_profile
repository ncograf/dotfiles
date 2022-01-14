# start graphical environment
if  [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi

# opam configuration 
# this was used for the course Compiler Design in Fall Semester 2021 at ETH
test -r /home/nico/.opam/opam-init/init.sh && . /home/nico/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
