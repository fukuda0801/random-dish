#!/bin/bash
set -e

rm -f /random_dish/tmp/pids/server.pid

exec "$@"
