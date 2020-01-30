export KAFKA_OPTS="-Djava.security.auth.login.config=jaas.conf -Xmx1G"

export TOPIC_NAME=ha_test
export TOPIC_PARTITIONS=6
export TOPIC_REPLICATION=2
export TOPIC_PER_PARTITION_ELEMENT_COUNT=10000

export CONSUMER_GROUP_NAME=ha_test_cg

export SITE_A_BROKER_ADDRESS=shared-cdh6-2.dilisim.local:9093
export SITE_A_COUNTER_INITIAL_VALUE=1

export SITE_B_BROKER_ADDRESS=shared-cdh6-2.dilisim.local:19093
export SITE_B_COUNTER_INITIAL_VALUE=$(( ${TOPIC_PER_PARTITION_ELEMENT_COUNT} + 1))
