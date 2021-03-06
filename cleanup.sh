#!/bin/bash
MONGO_CLEANUP_CMD="mongo --host=$MONGODB_DEST_HOST "

if [ ! -z "$MONGODB_DEST_PORT" ];
then
    MONGO_CLEANUP_CMD="$MONGO_CLEANUP_CMD --port $MONGODB_DEST_PORT ";
fi

if [ ! -z "$MONGODB_DEST_USER" ];
then
    MONGO_CLEANUP_CMD="$MONGO_CLEANUP_CMD --username $MONGODB_DEST_USER";
fi

if [ ! -z "$MONGODB_DEST_PASSWORD" ];
then
    MONGO_CLEANUP_CMD="$MONGO_CLEANUP_CMD --password $MONGODB_DEST_PASSWORD";
fi

MONGO_CLEANUP_CMD="$MONGO_CLEANUP_CMD --eval \"db = db.getSiblingDB('$MONGODB_DEST_DB'); db.dropDatabase()\"";
eval $MONGO_CLEANUP_CMD

