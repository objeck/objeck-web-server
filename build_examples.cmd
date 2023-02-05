@echo off

if [%1] == [] goto end
	obc -src hello_http.obs -lib net,json
REM	obc -src ssl_server.obs -lib net,json

	if [%2] NEQ [brun] goto brun
		obr ssl_server keys\cert.crt keys\cert.key 1234 8080
	:brun
:end

if [%1] NEQ []  goto usage
	@echo build.cmd [objeck_dir]
:usage