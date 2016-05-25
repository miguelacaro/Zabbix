<?php
/**
 *  Zabbix Php Api : host.get 
 * author: Alejandro Caro
 */
 
 // API Settings 
$url = 'http://zabbixserver/zabbix/api_jsonrpc.php';
$header = array("Content-type: application/json-rpc");
$user = 'Admin';
$password = 'zabbix';

//curl options
function Curl($url,$header,$info){
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL, $url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch,CURLOPT_HTTPHEADER,$header);
    curl_setopt($ch,CURLOPT_POST, 1);
    curl_setopt($ch,CURLOPT_POSTFIELDS, $info);
    $response = curl_exec($ch);
    curl_close($ch);
    return json_decode($response);
}

$logininfo = array(
  'jsonrpc' => '2.0',
  'method' => 'user.login',
  'params' => array(
    'user' => $user,
    'password' => $password,
  ),
  'id' => 1,
);
//$logininfo = '{"jsonrpc": "2.0","method":"user.login","params":{"user":"Admin","password":"zabbix"},"auth": null,"id":0}';
$data = json_encode($logininfo);


$result = Curl($url,$header,$logininfo);
//Result is an object
$token = $result->result;

$hostinfo = array(
    'jsonrpc' => '2.0',
    'method' => 'host.get',
    "params" =>array(
         "output" => ["hostid","name"],
         "filter" => array(
             "host" =>"",
            )
        ),
    "auth"=>$token,
    "id"=>1
);
// $hostinfo = '{"jsonrpc":"2.0","method":"host.get","params":{"output":["hostid","name"],"filter":{"host":""}},"auth":"e81981f57500ede530007104df178f08","id":1}';
$data = json_encode($hostinfo);
//print_r($data);
$result = Curl($url,$header,$data);
print_r($result);
