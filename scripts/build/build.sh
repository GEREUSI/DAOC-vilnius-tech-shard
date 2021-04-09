#!/bin/bash

cd /app
msbuild -p:configuration=Debug -t:restore
msbuild -p:configuration=Debug

chmod -R 777 /app/Debug
chmod -R 777 /app/build
