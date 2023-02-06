@echo off

pushd .. && build_examples ..\objeck-lang && popd
obc config_test.obs -lib json,net