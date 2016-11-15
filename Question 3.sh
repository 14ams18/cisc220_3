#!/bin/bash

read -p "Enter the password: " -s pword
str=0
if ((${#pword}>= 8)); then
	str=$((str+1))
fi
if [[ $pword == *[0-9]* ]]; then
	str=$((str+1))
fi
if [[ $pword == *[+@#\$=%\&*-]* ]]; then
	str=$((str+1))
fi

if (( $str == 0 )); then
	echo "Invalid Password"
elif (( $str == 1 )); then
	echo "Password Strength: Weak"
elif (( $str == 2 )); then
	echo "Password Strength: Moderate"
else
	echo "Password Strength: Strong"
fi
