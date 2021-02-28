#!/bin/bash

SCRIPTS_PATH=$(dirname "$(readlink -f "$0")")
source "$SCRIPTS_PATH/.env"

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

mv public-db.sql "$MIGRATIONS_FOLDER/migration_$(date -u +%Y%m%d%H%M%S).sql"
