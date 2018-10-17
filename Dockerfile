# Fetch the mc command line client
FROM alpine:latest
LABEL maintainer="Benjamin Pannell <admin@sierrasoftworks.com>"

RUN apk update && apk add ca-certificates wget && update-ca-certificates
RUN wget -O /usr/bin/mc https://dl.minio.io/client/mc/release/linux-amd64/mc
RUN chmod +x /usr/bin/mc

ADD entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENV MINIO_SERVER=""
ENV MINIO_BUCKET="acme"
ENV MINIO_ACCESS_KEY=""
ENV MINIO_SECRET_KEY=""
ENV MINIO_API_VERSION="S3v4"
ENV SECRETS_VOLUME="/secrets/acme"

ENTRYPOINT [ "/app/entrypoint.sh" ]