export TRUSTSTORE_PATH=/usr/java/jdk1.8.0_231-amd64/jre/lib/security/cacerts
export TRUSTSTORE_PASSWORD=changeit

export TOPIC_NAME=ha_test
export TOPIC_PARTITIONS=6
export TOPIC_REPLICATION=2
export TOPIC_PER_PARTITION_ELEMENT_COUNT=100

export CONSUMER_GROUP_NAME=ha_test_cg

export SITE_A_SRM_NAME=kafka1
export SITE_A_BROKER_ADDRESS=shared-cdh6-2.dilisim.local:9093
export SITE_A_COUNTER_INITIAL_VALUE=1
export SITE_A_ELEMENT_COUNT=17

export SITE_B_SRM_NAME=kafka2
export SITE_B_BROKER_ADDRESS=shared-cdh6-2.dilisim.local:19093
export SITE_B_COUNTER_INITIAL_VALUE=$(( ${SITE_A_ELEMENT_COUNT} + 2))
export SITE_B_ELEMENT_COUNT=11

# DONT CHANGE ANYTHING BELOW THIS LINE
export TRUSTSTORE_SETTINGS="-Djavax.net.ssl.trustStore=${TRUSTSTORE_PATH} -Djavax.net.ssl.trustStorePassword=${TRUSTSTORE_PASSWORD}"
export KAFKA_OPTS="${TRUSTSTORE_SETTINGS} -Djava.security.auth.login.config=jaas.conf -Xmx1G"
