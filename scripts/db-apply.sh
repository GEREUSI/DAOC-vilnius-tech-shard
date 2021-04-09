#!/bin/bash

SCRIPTS_PATH="$(dirname "$(readlink -f "$0")")"
ENV_PATH="$SCRIPTS_PATH/../.env"
source $ENV_PATH

if [ ! "$(docker ps -a | grep ${DATABASE_CONTAINER_NAME})" ]; then
    echo "Container ${DATABASE_CONTAINER_NAME} is not running!"
    exit
fi

APPLIED="$MIGRATIONS_FOLDER/.applied"
touch $APPLIED

APPLICATIONS=$(ls $MIGRATIONS_FOLDER | grep -v -f $APPLIED)
echo "Applying following migrations:"
for APPLICATION in $APPLICATIONS; do
    echo "$MIGRATIONS_FOLDER/$APPLICATION"
    docker exec -i ${DATABASE_CONTAINER_NAME} mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < "$MIGRATIONS_FOLDER/$APPLICATION"
    echo $APPLICATION >> $APPLIED
done
