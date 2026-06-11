from pyspark import pipelines as dp
from pyspark.sql.functions import col, current_timestamp


@dp.table(name="silver_raw_kafka_messages")
def silver_raw_kafka_messages():
    return (
        spark.readStream
            .table("lpbank.bronze.bronze_raw_kafka_messages")
            .where(col("value").isNotNull())
            .select(
                col("topic"),
                col("partition"),
                col("offset"),
                col("kafka_timestamp"),
                col("key"),
                col("value"),
                col("landing_ingestion_time"),
                col("bronze_ingestion_time"),
                current_timestamp().alias("silver_ingestion_time")
            )
    )
