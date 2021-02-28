#!/bin/bash

SCRIPTS_PATH=$(dirname "$(readlink -f "$0")")
source "$SCRIPTS_PATH/.env"

docker run --rm -v ${APP_LOCAL_PATH}:${APP_CONTAINER_PATH} -v ${BUILD_SCRIPTS_LOCAL_PATH}:${BUILD_SCRIPTS_CONTAINER_PATH} -it ${MONO_IMAGE} ${BUILD_SCRIPTS_CONTAINER_PATH}/build.sh