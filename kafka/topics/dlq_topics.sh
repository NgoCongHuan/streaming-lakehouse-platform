docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic dlq.postgres.corebank \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=1209600000