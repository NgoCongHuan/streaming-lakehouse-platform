from pyspark import pipelines as dp
from pyspark.sql.functions import col, count, max as max_


@dp.materialized_view(name="gold_kafka_topic_summary")
def gold_kafka_topic_summary():
    return (
        spark.read
            .table("lpbank.silver.silver_raw_kafka_messages")
            .groupBy(col("topic"))
            .agg(
                count("*").alias("message_count"),
                max_("kafka_timestamp").alias("latest_kafka_timestamp")
            )
    )
