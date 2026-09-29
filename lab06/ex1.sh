#!/bin/bash
DIR=case/logs/
WEB_LINES=$(wc -l < "$DIR"access.log)
echo $WEB_LINES
BLOCK=$(grep BLOCK < "$DIR"firewall.log | wc -l)
echo "The amount of BLOCK decisions in "$DIR" is "$BLOCK""
FAILED=$(grep "Failed password" "$DIR"auth.log |
    awk '{for(i=1;i<=NF;i++) if($i=="from") print $(i+1)}' |
    sort | uniq -c | sort -nr | head -1) | awk '{print $2}'
#4.Inputting the file with < gives a clean output, rather than directing to file location with -l "dir" leaves the dir in the output
#5.The output is all one 1 line, it becomes words rather than lines of output
echo "Total requests in access.log from sqlmap: $(grep sqlmap "$DIR"access.log | wc -l), Total percentage of all requests: $(($(grep sqlmap "$DIR"access.log | wc -l) * 100 / "$WEB_LINES"))"
