#!/bin/sh
set -eo pipefail

host="$(hostname -i || echo '54.145.199.161')"

if ping="$(redis-cli -h "$host" ping)" && [ "$ping" = 'PONG' ]; then
	exit 0
fi

exit 1
