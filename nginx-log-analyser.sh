#!/bin/bash

echo "Top 5 IP addresses with the most requests:"
awk '{ print $1 }' nginx-access.log | sort | uniq --count | sort -r | head -n 5 | awk '{ print $2 " - " $1 " request(s)" }'
echo

echo "Top 5 most requested paths:"
grep -o 'GET /[^ ]*' nginx-access.log | sort | uniq -c | sort -r | head -n 5 | awk '{ print $3 " - " $1 " request(s)" }'
echo

echo "Top 5 response status codes:"
grep -o 'HTTP/[^ ]* [0-9][0-9][0-9]' nginx-access.log | sort | uniq -c | sort -r | head -n 5 | awk '{ print $3 " - " $1 " request(s)" }'
echo

echo "Top 5 user agents:"
awk -F '"' '{ print $6 }' nginx-access.log | sort | uniq --count | sort -r | head -n 5 | awk '{ for(i = 2; i <= NF; i++) printf "%s ", $i; print "- " $1 " request(s)" }'
echo