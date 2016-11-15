#!/bin/bash

read -p "Enter words you wish to reverse: " -a wordList
for (( i=0; i< ${#wordList[*]}; i++)) ; do
	word=${wordList[$i]}
	length=${#word}
	for (( letter=0; letter<$length; letter++ )) ; do
		printf ${word:(-1)}
		word=${word:0:-1}
	done
	printf " "	
done
printf "\n"
