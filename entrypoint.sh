#! /bin/bash
set -e -o pipefail

mc config host add acme "$MINIO_SERVER" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY" "$MINIO_API_VERSION" > /dev/null

mc mirror -w $SECRETS_VOLUME acme/${MINIO_BUCKET}