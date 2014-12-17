# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Run the container

Using the `docker` command:

    CONTAINER="adminerdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer/ssl/certs \
      -v /adminer/ssl/private \
      simpledrupalcloud/data:dev

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminerdata \
      -e SERVER_NAME="localhost" \
      -d \
      simpledrupalcloud/adminer:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

## Connect directly to MySQL server by linking with another Docker container

    CONTAINER="adminerdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer/ssl/certs \
      -v /adminer/ssl/private \
      simpledrupalcloud/data:dev
      
    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminerdata \
      --link mysqld:db \
      -e SERVER_NAME="localhost" \
      -e DB_USERNAME="root" \
      -e DB_PASSWORD="root" \
      -d \
      simpledrupalcloud/adminer:dev

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/adminer:dev . \
      && cd -

## Back up Adminer data

    sudo docker run \
      --rm \
      --volumes-from adminerdata \
      -v $(pwd):/backup \
      simpledrupalcloud/data:dev tar czvf /backup/adminerdata.tar.gz /adminer/ssl/certs /adminer/ssl/private

## Restore Adminer data from a backup

    sudo docker run \
      --rm \
      --volumes-from adminerdata \
      -v $(pwd):/backup \
      simpledrupalcloud/data:dev tar xzvf /backup/adminerdata.tar.gz

## License

**MIT**
