#!/bin/bash

cd /usr/share/

git clone "https://x-token-auth:$(curl -X POST -u "${CREDENTIALS}" https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials | grep -Po '(?<="access_token": ")[^"]*')@bitbucket.org/${GIT_REPO}" application

cd application

activator clean stage

target/universal/stage/bin/`ls target/universal/stage/bin/ | head -n1` \
-Dapplication.secret=${APPLICATION_SECRET} \
-Dapplication.home=/usr/share/application/ \
-Dplay.evolutions.db.default.autoApply=${EVOLUTION_ENABLED} \
-Dslick.dbs.default.db.url="jdbc:${DB_TYPE}://${DB_HOST}:${DB_PORT}/${DB_NAME}" \
-Dslick.dbs.default.db.user=${DB_USER} \
-Dslick.dbs.default.db.password="${DB_PASSWORD}" 

