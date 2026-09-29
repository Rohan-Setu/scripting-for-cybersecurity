#!/bin/bash

if [ $# -ne 1 ]; then
echo "error, no argument supplied"
echo "correct usage: attacker_report.sh <log file>"
exit 1
fi

if [ ! -f $1 ]; then
echo "error "$1" is not a file"
exit 2
fi

LOG_FILE=$1

echo "Total failed password events: $(grep "Failed Password" "$LOG_FILE")"
echo "Ip with the most failed attempts: $(grep "Failed password" "$AUTH_LOG" |
    awk '{for(i=1;i<=NF;i++) if($i=="from") print $(i+1)}' |
    sort | uniq -c | sort -nr | head -3)"
echo "Busiest source Ips: "$(./top.sh)"
echo "Top targeted usernames "$(grep "Failed password" "$AUTH_LOG" |
    awk '{for(i=1;i<=NF;i++) if($i=="for") print $(i+1)}' |
    sort | uniq -c | sort -nr | head -n 3)"

exit 0
