source env.sh

kafka-topics --delete --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${TOPIC_NAME}
kafka-topics --create --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${TOPIC_NAME} --partitions ${TOPIC_PARTITIONS} --replication-factor ${TOPIC_REPLICATION}
kafka-topics --describe --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${TOPIC_NAME}
for i in $(seq 1 ${TOPIC_PER_PARTITION_ELEMENT_COUNT})
do
  for j in $(seq 1 ${TOPIC_PARTITIONS})
  do
    echo "$j:$i"
  done
done | kafka-console-producer --broker-list ${BROKER_ADDRESS} --topic ${TOPIC_NAME} --producer.config client.properties --property "parse.key=true" --property "key.separator=:"