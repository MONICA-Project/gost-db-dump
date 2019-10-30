#!/bin/bash

echo "GOST_DB_HOST is $GOST_DB_HOST"
echo "GOST_DB_PORT is $GOST_DB_PORT"
echo "GOST_DB is $GOST_DB"
echo "GOST_DB_USER is $GOST_DB_USER"
echo "GOST_DB_PASSWORD is $GOST_DB_PASSWORD"

echo "$GOST_DB_HOST:$GOST_DB_PORT:$GOST_DB:$GOST_DB_USER:$GOST_DB_PASSWORD" > ~/.pgpass
chmod 0600 ~/.pgpass
pg_dump --no-acl -h $GOST_DB_HOST -p $GOST_DB_PORT -U $GOST_DB_USER $GOST_DB > /monica/dumps/gost.sql
