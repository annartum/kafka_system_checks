PARTITION_COUNT=6
export KAFKA_OPTS="-Djava.security.auth.login.config=jaas.conf -Xmx1G"
kafka-topics --delete --bootstrap-server shared-cdh6-2.dilisim.local:9093 --command-config client.properties --topic ha_test
kafka-topics --create --bootstrap-server shared-cdh6-2.dilisim.local:9093 --command-config client.properties --topic ha_test --partitions ${PARTITION_COUNT} --replication-factor 3
kafka-topics --describe --bootstrap-server shared-cdh6-2.dilisim.local:9093 --command-config client.properties --topic ha_test
for i in {1..100000}
do
  for j in $(seq 1 ${PARTITION_COUNT})
  do
    echo "$j:$i"
  done
done | kafka-console-producer --broker-list shared-cdh6-2.dilisim.local:9093 --topic ha_test --producer.config client.properties --property "parse.key=true" --property "key.separator=:"
