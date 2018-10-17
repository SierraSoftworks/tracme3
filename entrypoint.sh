#! /bin/sh
set -e -o pipefail

mc config host add acme "$MINIO_SERVER" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY" "$MINIO_API_VERSION" > /dev/null

mc cp --recursive acme/${MINIO_BUCKET}/ ${SECRETS_VOLUME}/
chmod 600 ${SECRETS_VOLUME}/*

if [[ "${1-watch}" == "watch" ]]; then
    mc mirror -w --overwrite $SECRETS_VOLUME/ acme/${MINIO_BUCKET}
fi