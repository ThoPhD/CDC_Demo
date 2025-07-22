curl -X PUT http://localhost:8083/connectors/pg-cdc/config \
    -H "Content-Type: application/json" \
    -d '{
        "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
        ...
        "table.include.list": "public.customers,public.orders",
        ...
    }'
