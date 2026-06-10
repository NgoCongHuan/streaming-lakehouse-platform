docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.customer \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.account \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.transaction \
  --partitions 6 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.branch \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.loan_account \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.deposit_account \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.customer_address \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic cdc.postgres.corebank.customer_contact \
  --partitions 3 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --config cleanup.policy=delete