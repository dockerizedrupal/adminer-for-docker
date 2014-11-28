# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Adminer (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -d \
      simpledrupalcloud/adminer:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

#### Connect directly to MySQL server by linking with another Docker container

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      --link mysqld:db \
      -e DB_USERNAME="root" \
      -e DB_PASSWORD="root" \
      -d \
      simpledrupalcloud/adminer:dev

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/adminer:dev . \
      && cd -

## License

**MIT**
