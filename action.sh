#!/bin/bash
set -e

sudu apt update
sudo apt-get -y install mysql-client

git config --global user.name ${INPUT_MYSQL_DB}
#git config --global user.email ${INPUT_MYSQL_DB}@${INPUT_GIT_HOST}

mysqldump -u${INPUT_MYSQL_USER} -p$INPUT_MYSQL_PASS --set-gtid-purged=OFF --no-data ${INPUT_MYSQL_DB} -h ${INPUT_MYSQL_HOST} > ${INPUT_SCHEMA_PATH}

git commit -m "Updating schema for ${INPUT_MYSQL_PATH}" ${INPUT_SCHEMA_PATH}
git push --force
