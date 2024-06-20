#!/bin/bash
  
function input {
    START=$(date +'%s%N')
    START_TIME=$(date | awk '{print $4}')
    DATE="$(date +'%d%m%y')"
    DIRECTORY=$(pwd)

    param='\/[s]?bin'
    if [[ $DIRECTORY =~ $param ]]; then
        echo "error"
        exit 1
    fi

    if [[ ${#letters_folders} -lt 5 ]]; then
        for (( i=${#letters_folders}; i<5; i++ )); do
            letters_folders+="$(echo ${letters_folders:0:1})"
        done
    fi

    if [[ ${#letters_files1} -lt 5 ]]; then
        for (( i=${#letters_files1}; i<5; i++ )); do
            letters_files1+="$(echo ${letters_files1:0:1})"
        done
    fi
}

function output {
    origin_length=${#letters_files1}
    num_folders=100
    for (( i=1; i<=$num_folders; i++ )); do
        sudo mkdir $DIRECTORY"/"$letters_folders"_"$DATE
        num_files=$(echo $(( 1 + $RANDOM % 100)))
        for (( j=1; j<=$num_files; j++ )); do
            sudo fallocate -l $size_files1"MB" $DIRECTORY"/"$letters_folders"_"$DATE"/"$letters_files1"_"$DATE"."$letters_files2
            echo $DIRECTORY"/"$letters_folders"_"$DATE"/"$letters_files1"_"$DATE"."$letters_files2"  "$(date)"  "$size_files1"Mb" >> logs.txt
            letters_files1+="$(echo ${letters_files1:0:1})"
            avail_space=$(df -h / -BM | grep '/' | awk -F"M" {'print $3'})
            if [[ $avail_space -le 1024 ]]; then
                FINISH_TIME=$(date | awk '{print $4}')
                END=$(sudo date +'%s%N')
                export DIFF=$((( $END - $START ) / 100000000 ))
                echo "Script started at $START_TIME"
                echo "Script finished at $FINISH_TIME"
                echo "Script execution time (in seconds) = $(( $DIFF / 10 )).$(( $DIFF % 10 ))"
                exit 1
            fi
        done
        letters_files1=${letters_files1:0:origin_length}
        letters_folders+="$(echo ${letters_folders:0:1})"
    done
}
