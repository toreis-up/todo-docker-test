#!/bin/bash
set -e

rm -f /ruby/tmp/pids/server.pid
exec "$@"