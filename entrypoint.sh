#!/bin/sh -l
set -xe

user=$1
token=$2
url=$3
job=$4
parameters=$5

CRUMB=$(curl -u "$user:$token" -s "$url/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)")

if [ -z "$parameters" ]; then
    curl -u "${user}:${token}" -H $CRUMB -X POST "${url}/job/${job}/build"
else
    curl -u "${user}:${token}" -H $CRUMB -X POST "${url}/job/${job}/buildWithParameters?${parameters}"
fi
