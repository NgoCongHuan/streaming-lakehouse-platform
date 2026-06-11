from pyspark import pipelines as dp
from pyspark.sql.functions import col, current_timestamp


@dp.table(name="bronze_raw_kafka_messages")
def bronze_raw_kafka_messages():
    return (
        spark.readStream
            .table("lpbank.landing.raw_kafka_messages")
            .select(
                col("topic"),
                col("partition"),
                col("offset"),
                col("timestamp").alias("kafka_timestamp"),
                col("key"),
                col("value"),
                col("ingestion_time").alias("landing_ingestion_time"),
                current_timestamp().alias("bronze_ingestion_time")
            )
    )
