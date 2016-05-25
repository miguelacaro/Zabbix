#!/bin/bash
#
###########################################################
#
# Name: create_webscenario
# Create a webscenario on Zabbix via the Zabbix Api
# Author: Alejandro Caro
# Date: 24/05/2016
#
###########################################################
#
# Usage:
#./create_webscenario.sh <WebScenario Name> <Url> <user-agent> <Time Frequency>
#
###############################################################################



#PARAMETERS
###########

NAME="$1"
URL=$2
USERAGENT="Mozilla/5.0"

TIME=900

#VARIABLES
###########

ZABBIZURLAPI=http://zabbixserver/zabbix/api_jsonrpc.php
HOSTID=10105
#METHOD="httptest.create"
METHOD="httptest.create"
STATUS_CODE=200
AUTHAPICODE="xxxxxxxxxxxxxxxxxxxx"


########################################################

#Command Line options help

if [[ $# -le 1 ]]; then
 echo ""
echo "Usage: `basename $0` <Name> <Url> <User-agent> <Time>"
echo ""
  exit 0
else

# JSON RPC 2.0 Request to  Zaabix api
curl -i -X POST -H 'Content-Type: application/json' -d '{ "jsonrpc": "2.0",  "method": "'"$METHOD"'",   "params": { "name": "'"${NAME}"'"   , "delay": "'"$TIME"'", "agent": "'"${USERAGENT}"'", "hostid": "'"${HOSTID}"'",     "steps": [{    "name": "'"${NAME}"'", "url": "'"${URL}"'", "status_codes": "'"$STATUS_CODE"'",  "no": 1  } ] }, "auth":  "7100318aa7c6b35fd99d055258600b54" , "id":12}' $ZABBIZURLAPI 
echo ""
fi

