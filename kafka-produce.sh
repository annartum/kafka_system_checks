source env.sh

kafka-topics --delete --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${HA_TEST_TOPIC}
kafka-topics --create --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${HA_TEST_TOPIC} --partitions ${HA_TEST_TOPIC_PARTITIONS} --replication-factor ${HA_TEST_TOPIC_REPLICATION}
kafka-topics --describe --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${HA_TEST_TOPIC}
for i in $(seq 1 ${HA_TEST_PER_PARTITION_ELEMENT_COUNT})
do
  for j in $(seq 1 ${HA_TEST_TOPIC_PARTITIONS})
  do
    echo "$j:$i"
  done
done | kafka-console-producer --broker-list ${BROKER_ADDRESS} --topic ${HA_TEST_TOPIC} --producer.config client.properties --property "parse.key=true" --property "key.separator=:"
