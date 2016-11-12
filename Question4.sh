#!/bin/bash 

lsblk -nr | grep -e part | sort -k4hr | head -2
