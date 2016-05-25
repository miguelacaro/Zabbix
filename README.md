Zabbix
======

Zabbix

Connect to Zabbix Api from command line with curl 

curl -i -X POST -H 'Content-Type:application/json' -d'{"jsonrpc": "2.0","method":"user.login","params":{"user":"admin","password":"zabbix"},"auth": null,"id":1}' http://zabbixserver/api_jsonrpc.php



