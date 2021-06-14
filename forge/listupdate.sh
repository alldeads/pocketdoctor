#!/bin/sh
output=$(apt-get -s --no-download dist-upgrade -V | grep '=>' | awk '{print "|"$1,"|", $2,$3,$4,"|"}')
host=$(cat /proc/sys/kernel/hostname)
echo "$output"

curl -i -X POST --data-urlencode 'payload={
  "username": "Update",
  "text": "***'"$host"'***\n
|Package Name | Updates |
|--- | --- |
'"$output"'"
}' https://mattermost.coreproc.com/hooks/c5d3ifhow7n4djitpdm8kwa9qy

