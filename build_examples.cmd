@echo off

rem rebuild network libraries
if [%1] NEQ [] (
	obc -src %1\core\compiler\lib_src\net_common.obs,%1\core\compiler\lib_src\net.obs,%1\core\compiler\lib_src\net_secure.obs -tar lib -dest %1\core\release\deploy64\lib\net.obl
)

obc -src hello_http.obs -lib net,json
obc -src form_post_https.obs -lib net,json
obc -src compress_response_https.obs -lib net,json