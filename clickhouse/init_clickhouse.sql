CREATE DATABASE IF NOT EXISTS warehouse;

CREATE TABLE IF NOT EXISTS warehouse.inventory_customers (
  payload String
) ENGINE = Kafka
SETTINGS
  kafka_broker_list = 'kafka:9092',
  kafka_topic_list = 'dbserver1.public.customers',
  kafka_group_name = 'ck_consumer',
  kafka_format = 'JSONEachRow',
  kafka_num_consumers = 1;

CREATE TABLE IF NOT EXISTS warehouse.inventory_customers (
  id UInt32,
  name String,
  email String
) ENGINE = MergeTree
ORDER BY id;

CREATE MATERIALIZED VIEW IF NOT EXISTS warehouse.mv_inventory_customers
TO warehouse.inventory_customers
AS
SELECT
  JSONExtractUInt(payload, 'after.id') AS id,
  JSONExtractString(payload, 'after.name') AS name,
  JSONExtractString(payload, 'after.email') AS email
FROM warehouse.inventory_customers
WHERE JSONExtractString(payload, 'op') = 'c';
