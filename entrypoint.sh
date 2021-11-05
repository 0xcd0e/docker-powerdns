#!/bin/bash
set -e

ETCDIR="/etc/powerdns/"
[ ! -d "$ETCDIR" ] && mkdir -p "$ETCDIR"

CONFDIR="/etc/powerdns/pdns.d/"
[ ! -d "$CONFDIR" ] && mkdir -p "$CONFDIR"

CONFFILE=/etc/powerdns/pdns.conf
if [ ! -f "$CONFFILE" ]; then
    curl -sSL https://raw.githubusercontent.com/0xcd0e/docker-powerdns/master/pdns.conf -o $CONFFILE
	echo "Config file downloaded because it didnt exist, edit it and restart the container."
	exit 1
fi

# --help, --version
[ "$1" = "--help" ] || [ "$1" = "--version" ] && exec pdns_server $1
# treat everything except -- as exec cmd
[ "${1:0:2}" != "--" ] && exec "$@"

# Run pdns server
trap "pdns_control quit" SIGHUP SIGINT SIGTERM

pdns_server "$@" &

wait
