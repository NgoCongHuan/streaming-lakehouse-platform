docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic connect-configs \
  --partitions 1 \
  --replication-factor 1 \
  --config cleanup.policy=compact

docker exec -it kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic connect-offsets \
  --partitions 25 \
  --replication-factor 1 \
  --config cleanup.policy=compact