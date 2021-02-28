#!/bin/bash

cd /app
msbuild /t:restore
msbuild

