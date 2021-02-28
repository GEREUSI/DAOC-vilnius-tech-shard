#!/bin/bash

SCRIPTS_PATH=$(dirname "$(readlink -f "$0")")
source "$SCRIPTS_PATH/.env"

docker run --rm -v ${APP_LOCAL_PATH}:${APP_CONTAINER_PATH} -p 10300:10300 -it ${MONO_IMAGE} mono /app/Debug/DOLServer.exe
