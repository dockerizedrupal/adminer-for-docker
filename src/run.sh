#!/usr/bin/env bash

dnsLookup() {
  echo "$(host "${1}" | awk '/has address/ { print $4 }')"
}

if [ -z "${MYSQLD_PORT_3306_TCP}" ] && [ -n "${MYSQLD_PORT_3306_TCP_ADDR}" ] && [ -n "${MYSQLD_PORT_3306_TCP_PORT}" ]; then
  IP="$(dnsLookup "${MYSQLD_PORT_3306_TCP_ADDR}")"

  if [ ! -z "${IP}" ]; then
    MYSQLD_PORT_3306_TCP_ADDR="${IP}"
  fi

  MYSQLD_PORT_3306_TCP="tcp://${MYSQLD_PORT_3306_TCP_ADDR}:${MYSQLD_PORT_3306_TCP_PORT}"
fi

export FACTER_MYSQLD_PORT_3306_TCP="$(echo "${MYSQLD_PORT_3306_TCP}" | sed 's/tcp:\/\///')"

if [ -n "${MYSQLD_USERNAME}" ]; then
  export FACTER_MYSQLD_USERNAME="${MYSQLD_USERNAME}"
fi

if [ -n "${MYSQLD_PASSWORD}" ]; then
  export FACTER_MYSQLD_PASSWORD="${MYSQLD_PASSWORD}"
fi

env

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
