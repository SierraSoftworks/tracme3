#! /bin/sh
set -e -o pipefail

mc config host add acme "$MINIO_SERVER" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY" "$MINIO_API_VERSION" > /dev/null

mc cp --recursive acme/${MINIO_BUCKET}/ ${SECRETS_VOLUME}/
mc mirror -w --overwrite $SECRETS_VOLUME/ acme/${MINIO_BUCKET}