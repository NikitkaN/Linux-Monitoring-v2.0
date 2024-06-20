#!/bin/bash

function arg {
    if [[ ${args} -ne 1 ]] ; then
	echo "Example of running a script: ./main.sh 1"
    	exit 1
    fi

    if [[ ${cleaning} -gt 3 || ${cleaning} -lt 1 ]]; then
        echo "error"
        exit 1
    fi

    if [[ $cleaning -eq 1 ]]; then
        clean1
    elif [[ $cleaning -eq 2 ]]; then
        clean2
    elif [[ $cleaning -eq 3 ]]; then
        clean3
    fi
}
