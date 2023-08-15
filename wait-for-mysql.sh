#!/bin/sh

set -e
host="$1"
port="$2"
shift 2
cmd="$@"

until nc -z -v -w30 "$host" "$port"; do
    echo "waiting for mysql to be available at $host:@port..."
    sleep 1
done

>&2 echo "MySql is up - executing command"
exec $cmd

