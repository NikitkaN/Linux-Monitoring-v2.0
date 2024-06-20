#!/bin/bash

function arg {
    if [[ $args -ne 3 ]] ; then
        echo "Example of running a script: ./main.sh az az.az 3Mb"
        exit 1
    fi

    param1='^[A-Za-z]+$'
    if ! [[ $letters_folders =~ $param1 ]]; then
        echo "error"
        exit 1
    else
        if [[ ${#letters_folders} -gt 7 ]]; then
        echo "error"
        exit 1
        fi
    fi

    param2='^[A-Za-z]{1,7}[.][A-Za-z]{1,3}$'
    if ! [[ $letters_files =~ $param2 ]]; then
        echo "error"
        exit 1
    fi
    export letters_files1=$(echo $letters_files | awk -F. '{print $1}')
    export letters_files2=$(echo $letters_files | awk -F. '{print $2}')

    param3='^[0-9]+Mb$'
    if ! [[ $size_files =~ $param3 ]]; then
        echo "error"
        exit 1
    else
        export size_files1=$(echo $size_files | awk -F"Mb" '{print $1}')
        if [[ ($size_files1 -gt 100) || ($size_files1 -lt 1) ]]; then
        echo "error"
        exit 1
        fi
    fi
}
