docker exec -it kafka kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.customer \
  --partitions 3 \
  --replication-factor 1

docker exec -it kafka kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.account \
  --partitions 3 \
  --replication-factor 1

docker exec -it kafka kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.transaction \
  --partitions 6 \
  --replication-factor 1