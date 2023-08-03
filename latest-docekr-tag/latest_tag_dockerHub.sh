#!/bin/bash

UNAME="dokcer_username"
UPASS="dokcer_password"
ORG="organization"

svc=$1



TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${UNAME}'", "password": "'${UPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)



IMAGE_TAGS=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${ORG}/${svc}/tags/?page_size=100 | jq -r '.results|.[]|.name' | head -n 1)



version=$IMAGE_TAGS
major="${version%.*}"
patch="${version##*.}"
incremented_patch=$((patch + 1))
new_version="${major}.${incremented_patch}"
echo $new_version