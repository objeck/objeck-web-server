#!/bin/sh

export PATH=$PATH:../objeck-lang/core/release/deploy/bin
export OBJECK_LIB_PATH=../objeck-lang/core/release/deploy/lib

if [ ! -z "$2" ]; then
	obc -src $2/core/compiler/lib_src/net_common.obs,$2/core/compiler/lib_src/net.obs,$2/core/compiler/lib_src/net_secure.obs -lib json -tar lib -dest $2/core/release/deploy/lib/net.obl
fi

rm -f examples/*.obe examples/*.jpg 

obc -src examples/simple_config_https.obs -lib net,json
obc -src examples/hello_http.obs -lib net,json
obc -src examples/form_post_https.obs -lib net,json
obc -src examples/compress_response_https.obs -lib net,json
obc -src examples/multi_mime_https.obs -lib net,json
obc -src examples/passwd_https.obs -lib net,json

if [ ! -z "$1" ] && [ "$1" = "brun" ]; then
	obr examples/passwd_https
fi
