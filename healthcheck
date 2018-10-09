#!/bin/bash

# set an initial value for the flag
ARG_B=0

# read the options
TEMP=`getopt -o abc: --long url:,clientCert:,clientCertKey:,caCert: -n 'test.sh' -- "$@"`
eval set -- "$TEMP"

# extract options and their arguments into variables.
while true ; do
    case "$1" in
        -a|--url)
            case "$2" in
                "") URL='some default value' ; shift 2 ;;
                *) URL=$2 ; shift 2 ;;
            esac ;;
        -b|--clientCert)
            case "$2" in
                "") shift 2 ;;
                *) CLIENT_CERT=$2 ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        -c|--clientCertKey)
            case "$2" in
                "") shift 2 ;;
                *) CLIENT_KEY=$2 ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        -d|--caCert)
            case "$2" in
                "") shift 2 ;;
                *) CA_CERT=$2 ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

#STATUS=""

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

STATUS=`curl -I --stderr /dev/null  --cert $CLIENT_CERT --key $CLIENT_KEY --cacert $CA_CERT $URL 2>&1 | head -1 | cut -d ' ' -f2`

#echo $STATUS

if [ "$STATUS" == "200" ]
then
 echo "0"
else
 echo "1"
fi

