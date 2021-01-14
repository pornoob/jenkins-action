#!/bin/sh -l
set -xe

user=$1
token=$2
url=$3
job=$4
parameters=$5

# Sometimes the curl command runs before having a network connection
RETRY_TIMES=3

for i in `seq 1 1 ${RETRY_TIMES}`
do
    CRUMB=`curl -u "$user:$token" -s "$url/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)"`
    if [ -z "$CRUMB" ]; then
        sleep 1
    else
        break
    fi
done

if [ -z "$CRUMB" ]; then
    exit 1
fi

if [ -z "$parameters" ]; then
    curl -u "${user}:${token}" -H $CRUMB -X POST "${url}/job/${job}/build"
else
    curl -u "${user}:${token}" -H $CRUMB -X POST "${url}/job/${job}/buildWithParameters?${parameters}"
fi
