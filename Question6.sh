#!/bin/bash

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

while IFS='' read -r line || [[ -n "$line" ]]; do
        IFS=$'\t';
        read -r -a colArray <<< "$line";
        for i in "${!courseStudent[@]}"; do
                if [[ "$i" == "${colArray[0]}" ]]; then
                        sed -i s/${colArray[0]}/${courseStudent[$i]}"\t"/ student_course.txt
                fi
        done
        for k  in "${!courseStudent[@]}"; do
                if [[ "$k" == "${colArray[1]}" ]]; then
                        sed -i s/"\t"${colArray[1]}/"\t"${courseStudent[$k]}/ student_course.txt
                fi
        done
done < ~/cisc220_3/student_course.txt

echo "Output"
head -n1 student_course.txt
tail -n +2 student_course.txt | sort -k1,1 -Vk2,2
