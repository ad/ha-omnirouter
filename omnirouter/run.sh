#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

PORT=$(jq -r '.port // 20128' "$CONFIG_PATH")
DASHBOARD_PORT=$(jq -r '.dashboard_port // 0' "$CONFIG_PATH")

mkdir -p /share/omniroute

export PORT
export DATA_DIR=/share/omniroute

if [ "$DASHBOARD_PORT" != "0" ] && [ "$DASHBOARD_PORT" != "null" ] && [ -n "$DASHBOARD_PORT" ]; then
    export DASHBOARD_PORT
    echo "OmniRoute: API=:${PORT}, dashboard=:${DASHBOARD_PORT}, data=/share/omniroute"
else
    unset DASHBOARD_PORT
    echo "OmniRoute: combined :${PORT}, data=/share/omniroute"
fi

cd /app
exec node /app/dev/run-standalone.mjs
