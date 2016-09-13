#!/bin/bash
#
###########################################################
#
# Name: get_host_list.sh
# Show the full host list via the Zabbix Api
# Author: Alejandro Caro
# Date: 24/05/2016
#
###########################################################
#
# Usage:
#./get_host_list.sh
#
###############################################################################



#PARAMETERS
###########

###########

ZABBIZURLAPI=http://localhost:8080/zabbix/api_jsonrpc.php
METHOD="host.get"

#Replace this with the authapicode received from the user.login method 
AUTHAPICODE="xxxxxxxxxxxxxxxxxxxx"



########################################################

#Command Line options help

# JSON RPC 2.0 Request to  Zaabix api


curl -i -X POST -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","method":"host.get","params":{"output":["hostid","name"],"filter":{"host":""}},"auth":"605a157a702f34af7a982dba875b1bfb","id":12}' $ZABBIZURLAPIcho ""
