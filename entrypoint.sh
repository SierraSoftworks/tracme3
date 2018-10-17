#! /usr/bin/env bash
set -e -o pipefail

export AWS_ACCESS_KEY_ID="${MINIO_ACCESS_KEY-$AWS_ACCESS_KEY_ID}"
export AWS_SECRET_ACCESS_KEY="${MINIO_SECRET_KEY-$AWS_SECRET_ACCESS_KEY}"

mkdir -p ${SECRETS_VOLUME}
/usr/bin/goofys --endpoint $MINIO_SERVER -f ${MINIO_BUCKET} ${SECRETS_VOLUME}
