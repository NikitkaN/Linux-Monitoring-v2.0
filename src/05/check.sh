#!/bin/bash

function arg {
    if [[ ${args} -ne 1 ]] ; then
	      echo "Example of running a script: ./main.sh 1"
        exit 1
    fi

    if [[ ${search} -gt 4 || ${search} -lt 1 ]]; then
        echo "error"
        exit 1
    fi

    if [[ $search -eq 1 ]]; then
        search1
    elif [[ $search -eq 2 ]]; then
        search2
    elif [[ $search -eq 3 ]]; then
        search3
    elif [[ $search -eq 4 ]]; then
        search4
    fi
}