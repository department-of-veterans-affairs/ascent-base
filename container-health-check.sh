#!/bin/bash

#echo "Usage: ${0} <URL> <ClientCertLocation> <ClientKeyLocation> <CaCertLocation>"

URL="${1}"
CLIENT_CERT="${2}"
CLIENT_KEY="${3}"
CA_CERT="${4}"
STATUS=""

if [ -z "$URL" ]
then
  URL="https://localhost:8080/actuator/health"
fi

if [ -z "$CLIENT_CERT" ]
then
  CLIENT_CERT="/tmp/app.crt"
fi

if [ -z "$CLIENT_KEY" ]
then
  CLIENT_KEY="/tmp/app.key"
fi

if [ -z "$CA_CERT" ]
then
  CA_CERT="/usr/local/share/ca-certificates/ascent/vault-ca.crt"
fi

STATUS=`curl -s --cert $CLIENT_CERT --key $CLIENT_KEY --cacert $CA_CERT $URL | jq -r '.status'`

#echo $STATUS

if [ "$STATUS" == "UP" ]
then
 echo "0"
else
 echo "1"
fi

