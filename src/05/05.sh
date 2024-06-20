#!/bin/bash

function search1 {
    for (( i=1; i<6; i++ )) ; do
        sort -k 9 ../04/$i.log -o search1_$i.log
    done
    echo "Yeah!"
}

function search2 {
    for (( i=1; i<6; i++ )) ; do
        awk '{print $1}' ../04/$i.log  | uniq > search2_$i.log
    done
echo "Yeah!"
}

function search3 {
    for (( i=1; i<6; i++ )) ; do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log > search3_$i.log
    done
echo "Yeah!"
}

function search4 {
    for (( i=1; i<6; i++ )) ; do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log | awk '{print $1}' | uniq > search4_$i.log
    done
echo "Yeah!"
}
