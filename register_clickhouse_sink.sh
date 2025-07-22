#!/bin/bash

curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d '{
    "name": "clickhouse-sink",
    "config": {
      "connector.class": "com.altinity.clickhouse.sink.ClickHouseSinkConnector",
      "tasks.max": "1",
      "topics": "dbserver1.public.customers",
      "clickhouse.server.url": "http://clickhouse:8123",
      "clickhouse.server.user": "default",
      "clickhouse.server.password": "",
      "database": "default",
      "table.name": "inventory_customers"
    }
  }'
