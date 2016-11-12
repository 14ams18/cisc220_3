#!/bin/bash

for (( i=1000; i<=10000; i++ )); do
        length=${#i};
        num=i;
        while [[ $length>1 ]]; do
                sum=0;
                for (( k=0; $k<$length; k++ )); do
                        digit=${num:k:1};
                        sum=$(($digit + $sum));
                done
                num=$sum;
                length=${#num};
        done
        if (( $num==7 )); then
                echo $i;
        fi
done
