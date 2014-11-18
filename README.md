# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Adminer (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -d \
      simpledrupalcloud/adminer:latest
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && fig up

#### Connect automatically to MySQL server by linking with another Docker container

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      --link mysqld:db \
      -e DB_USERNAME="root" \
      -e DB_PASSWORD="root" \
      -d \
      simpledrupalcloud/adminer:latest

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/adminer:latest . \
      && cd -

## License

**MIT**
