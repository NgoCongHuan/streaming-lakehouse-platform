from pyspark import pipelines as dp
from pyspark.sql.functions import col, current_timestamp

kafka_bootstrap_servers = "vm-kafka-01:9092"

topics = ",".join([
    "cdc.postgres.customer",
    "cdc.postgres.account",
    "cdc.postgres.transaction",
    "cdc.postgres.branch",
    "cdc.postgres.loan_account",
    "cdc.postgres.deposit_account",
    "cdc.postgres.customer_address",
    "cdc.postgres.customer_contact"
])

@dp.table(name="raw_kafka_messages")
def raw_kafka_messages():
    return (
        spark.readStream
            .format("kafka")
            .option("kafka.bootstrap.servers", kafka_bootstrap_servers)
            .option("subscribe", topics)
            .option("startingOffsets", "earliest")
            .option("failOnDataLoss", "false")
            .load()
            .select(
                col("topic"),
                col("partition"),
                col("offset"),
                col("timestamp"),
                col("key").cast("string").alias("key"),
                col("value").cast("string").alias("value"),
                current_timestamp().alias("ingestion_time")
            )
    )
