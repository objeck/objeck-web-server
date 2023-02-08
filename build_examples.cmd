@echo off

rem rebuild network libraries
if [%2] NEQ [] (
	obc -src %2\core\compiler\lib_src\net_common.obs,%2\core\compiler\lib_src\net.obs,%2\core\compiler\lib_src\net_secure.obs -lib json -tar lib -dest %2\core\release\deploy64\lib\net.obl
)

del /q examples\*.obe examples\*.jpg 

obc -src examples\simple_config_https.obs -lib net,json
obc -src examples\hello_http.obs -lib net,json
obc -src examples\form_post_https.obs -lib net,json
obc -src examples\compress_response_https.obs -lib net,json
obc -src examples\multi_mime_https.obs -lib net,json
obc -src examples\passwd_https.obs -lib net,json

if [%1] == [brun] (
	obr examples\passwd_https
)