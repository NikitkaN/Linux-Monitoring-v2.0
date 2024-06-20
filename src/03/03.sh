#!/bin/bash
function clean1 {
    find_logs="$(dirname $(cat ../02/logs.txt | awk -F'  ' '{print $1}'))"
    param='^\/'
    for i in $find_logs; do
        if [[ $i =~ $param ]]; then
        sudo rm -rf $i
        fi
    done
    echo "Clear!"
}

function clean2 {
    echo "Example of start date and time: YYYY-MM-DD HH:MM"
    read -p "Write start date and time: " start
    param='^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$'

    if [[ $start =~ $param ]] ; then
        echo ""
    else
        echo "error"
        exit 1
    fi

    echo "Example of finish date and time: YYYY-MM-DD HH:MM"
    read -p "Write end date and time: " finish

    if [[ $finish =~ $param ]] ; then
        echo ""
    else
        echo "error"
        exit 1
    fi

    echo "Want to delete trash files? (Y/N)"
    yes1='y'
    yes2='Y'
    read y

    if ! [[ "${y}" = "${yes1}" ]] || [[ "${y}" = "${yes2}" ]] ; then
        echo "error"
        exit 1
    fi

    find_date="$(find ../02 -newermt "$start" ! -newermt "$finish" -type d)"

    for i in $find_date; do
        if ! [[ $i == '../02' ]] ; then
            sudo rm -rf $i
        fi
    done
    echo ""
    echo "Clear!"
}

function clean3 {
    echo "Example of mask for files: asda_DDMMYY"
    read -p "Write mask for files: " mask
    echo ""
    echo "Want to delete trash files? (Y/N)"
    yes1='y'
    yes2='Y'
    read y

    if ! [[ "${y}" = "${yes1}" ]] || [[ "${y}" = "${yes2}" ]] ; then
        echo "error"
        exit 1
    fi

    find_mask="$(find ../02 -name "*$mask")"

    for i in $find_mask; do
        if ! [[ $i == '../02' ]]; then
            sudo rm -rf $i
        fi
    done
    echo ""
    echo "Clear!"
}
