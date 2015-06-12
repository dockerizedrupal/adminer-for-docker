#!/usr/bin/env bash

puppet apply --modulepath=/src/adminer/run/modules /src/adminer/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
