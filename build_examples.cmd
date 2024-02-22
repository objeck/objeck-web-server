@echo off

rem rebuild network libraries
if [%1] NEQ [] (
	obc -src %1\core\compiler\lib_src\net_common.obs,%1\core\compiler\lib_src\net.obs,%1\core\compiler\lib_src\net_secure.obs -lib json -tar lib -dest %1\core\release\deploy64\lib\net.obl
)

del /q examples\*.obe examples\*.jpg 

REM obc -src examples\simple_config_https.obs -lib net,json
obc -src examples\weather_https.obs -lib net,json,misc
REM obc -src examples\hello_http.obs -lib net,json
REM obc -src examples\form_post_https.obs -lib net,json
REM obc -src examples\compress_response_https.obs -lib net,json
REM obc -src examples\multi_mime_https.obs -lib net,json
REM obc -src examples\passwd_https.obs -lib net,json
REM obc -src examples\jquery_config_https.obs -lib net,json

if [%2] == [server] (
	obr examples\weather_https
)

if [%2] == [client] (
	obc -src examples\client_https.obs -lib net,json,misc
	obr examples\client_https
)