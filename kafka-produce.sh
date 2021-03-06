source env.sh

BROKER_ADDRESS=$1
COUNTER_START=$2
ELEMENT_COUNT=$3

kafka-topics --create --bootstrap-server ${BROKER_ADDRESS} --command-config client.properties --topic ${TOPIC_NAME} \
	--partitions ${TOPIC_PARTITIONS} --replication-factor ${TOPIC_REPLICATION}

for i in $(seq ${COUNTER_START} $((${COUNTER_START} + ${ELEMENT_COUNT} - 1)) )
do
  for j in $(seq 1 ${TOPIC_PARTITIONS})
  do
    echo "$j:$i"
  done
done | kafka-console-producer --broker-list ${BROKER_ADDRESS} --topic ${TOPIC_NAME} --producer.config client.properties \
	--property "parse.key=true" --property "key.separator=:"
