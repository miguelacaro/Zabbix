Zabbix
======

Zabbix

Connect to Zabbix Api from command line with curl 

curl -i -X POST -H 'Content-Type:application/json' -d'{"jsonrpc": "2.0","method":"user.login","params":{"user":"admin","password":"zabbix"},"auth": null,"id":1}' http://zabbixserver/zabbix/api_jsonrpc.php


Show host list 
 '{"jsonrpc":"2.0","method":"host.get","params":{"output":["hostid","name"],"filter":{"host":""}},"auth":"xxxxxxxxxx","id":1}' http://zabbixserver/zabbix/api_jsonrpc.php
*




