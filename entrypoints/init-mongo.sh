#!/usr/bin/env bash
set -eu
mongosh -- "$MONGODB" <<EOF
    var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
    var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser, rootPassword);

    var user = '$MONGOUSER';
    var passwd = '${MONGOPASSWORD-}' || user;
    db.createUser({user: user, pwd: passwd, roles: ["readWrite"]});
EOF