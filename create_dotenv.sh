#!/usr/bin/env bash
set -e

# $1 username for postgres superuser
# $2 password for postgres superuser
# $3 username for regular postgres user
# $4 passowrd for regular postgres user

declare -A docker_variables=(
    ["IMAGE_TAG"]="flai"
)

declare -A vue_variables=(
    ["VUE_APP_HOST_PORT"]="3000"
    ["VUE_APP_CONTAINER_PORT"]="3000"
)

declare -A express_variables_docker=(
    ["EXPRESS_APP_HOST_PORT"]="5000"
    ["EXPRESS_APP_CONTAINER_PORT"]="5000"
)

declare -A express_variables_local=(
    ["PORT"]="5000"
)

declare -A postgres_variables=(
    ["POSTGRES_DB_HOST_PORT"]="5432"
    ["POSTGRES_DB_CONTAINER_PORT"]="5432"
    ["PG_USER"]="$1"
    ["PG_PASSWORD"]="$2"
    ["PG_DB"]="postgres"
    ["DEV_USER"]="$3"
    ["DEV_PASSWORD"]="$4"
    ["DEV_DB"]="flai_db_v1"
)

declare -A adminer_variables=(
    ["ADMINER_HOST_PORT"]="7000"
    ["ADMINER_CONTAINER_PORT"]="8080"
)

create_env_variables(){
    [ ! -e .env ] || rm .env
    for context in $1
    do
        declare -n dict=$context
        for key in "${!dict[@]}"
        do  
            echo "$key=${dict[$key]}" >> .env
        done
        unset -n dict
    done
}

create_env_variables 'docker_variables vue_variables express_variables_docker postgres_variables adminer_variables'

cd backend/express
create_env_variables 'express_variables_local'

echo "Created .env files"