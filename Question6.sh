#!/bin/bash

#The files must be named course.txt, student.txt, and student_course.txt
#The files need to be in the directory ~/cisc220_3/

declare -A courseStudent
declare -a lineArray
declare -a colArray

while IFS=$'\t' read -r line || [[ -n "$line" ]]; do
        IFS=$'\t';
        read -r -a lineArray <<< "$line";
        courseStudent[${lineArray[0]}]=${lineArray[1]};
done < ~/cisc220_3/course.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
        IFS=$'\t';
        read -r -a lineArray <<< "$line";
        courseStudent[${lineArray[0]}]=${lineArray[1]};
done < ~/cisc220_3/student.txt

cp student_course.txt output.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
        IFS=$'\t';
        read -r -a colArray <<< "$line";
        for i in "${!courseStudent[@]}"; do
                if [[ "$i" == "${colArray[0]}" ]]; then
                        sed -i s/${colArray[0]}/${courseStudent[$i]}"\t"/ output.txt
                fi
        done
        for k  in "${!courseStudent[@]}"; do
                if [[ "$k" == "${colArray[1]}" ]]; then
                        sed -i s/"\t"${colArray[1]}/"\t"${courseStudent[$k]}/ output.txt
                fi
        done
done < ~/cisc220_3/output.txt

echo "Output"
head -n1 output.txt
tail -n +2 output.txt | sort -k1,1 -Vk2,2
