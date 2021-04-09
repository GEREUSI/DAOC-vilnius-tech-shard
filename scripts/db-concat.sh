#!/bin/bash

SCRIPTS_PATH="$(dirname "$(readlink -f "$0")")"
ENV_PATH="$SCRIPTS_PATH/../.env"
source $ENV_PATH

MIGRATION_DATE_FORMAT="+%Y%m%d%H%M%S"
MIGRAION_REGEX="/^migration_[0-9]{14}\.sql/"
MIGRATIONS=$(ls $MIGRATIONS_FOLDER | awk -e $MIGRAION_REGEX | wc -l)
DB_CONCAT_DIR="$DATABASE_FOLDER/src/scripts/bin/linux/"

echo "Migrations: ${MIGRATIONS}"

cd "$DB_CONCAT_DIR"

if [ $MIGRATIONS -eq 0 ]; then 
    ./concat
else
    ./concat --update-only
fi

mkdir -p $MIGRATIONS_FOLDER
mv public-db.sql "$MIGRATIONS_FOLDER/migration_$(date -u $MIGRATION_DATE_FORMAT).sql"
