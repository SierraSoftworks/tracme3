# Fetch the mc command line client
FROM ubuntu:latest
LABEL maintainer="Benjamin Pannell <admin@sierrasoftworks.com>"

RUN apt-get update && apt-get install -y wget fuse
RUN wget -q -O /usr/bin/goofys http://bit.ly/goofys-latest

ADD entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh /usr/bin/goofys

ENV MINIO_SERVER=""
ENV MINIO_BUCKET="acme"
ENV MINIO_ACCESS_KEY=""
ENV MINIO_SECRET_KEY=""
ENV SECRETS_VOLUME="/secrets/acme"

CMD [ "/app/entrypoint.sh" ]