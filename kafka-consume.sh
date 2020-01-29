source env.sh

kafka-consumer-groups --bootstrap-server ${BROKER_ADDRESS} --topic ${HA_TEST_TOPIC} --command-config client.properties --group ${HA_TEST_CONSUMER_GROUP_NAME} --reset-offsets --to-earliest
kafka-console-consumer --bootstrap-server ${BROKER_ADDRESS} --topic ${HA_TEST_TOPIC} --consumer.config client.properties --property 'print.key=true' --property 'key.separator=:' > kafka_messages.txt
