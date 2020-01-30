export KAFKA_OPTS="-Djava.security.auth.login.config=jaas.conf -Xmx1G"

export BROKER_ADDRESS=shared-cdh6-2.dilisim.local:9093
export HA_TEST_TOPIC_NAME=ha_test
export HA_TEST_CONSUMER_GROUP_NAME=ha_test_cg
export HA_TEST_TOPIC_PARTITIONS=6
export HA_TEST_TOPIC_REPLICATION=3
export HA_TEST_PER_PARTITION_ELEMENT_COUNT=100000
