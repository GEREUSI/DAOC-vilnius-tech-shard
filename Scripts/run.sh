#!/bin/bash

SCRIPTS_PATH=$(dirname "$(readlink -f "$0")")
source "$SCRIPTS_PATH/.env"

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge - 
chmod 755 $XAUTH

docker run --rm -v ${XSOCK} -v ${XAUTH} -v ${APP_LOCAL_PATH}:${APP_CONTAINER_PATH} -e XAUTHORITY=$XAUTH -e DISPLAY=$DISPLAY -it ${MONO_IMAGE} mono /app/Debug/DOLServer.exe
