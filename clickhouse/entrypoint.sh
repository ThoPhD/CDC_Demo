#!/bin/bash

until clickhouse-client -q "SELECT 1" &>/dev/null; do
  echo "Waiting for ClickHouse to start..."
  sleep 1
done

clickhouse-client --multiquery < /docker-entrypoint-initdb.d/init_clickhouse.sql

tail -f /dev/null
