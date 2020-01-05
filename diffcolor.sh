#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9

do
GREEN="\033[9;3${i}m"

	echo -e "${GREEN}welcome $i times${NOCOLOR}"

done
