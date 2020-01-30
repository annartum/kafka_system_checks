source env.sh


kafka-consumer-groups --bootstrap-server ${SITE_A_BROKER_ADDRESS} --topic "${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest

kafka-consumer-groups --bootstrap-server ${SITE_A_BROKER_ADDRESS} --topic "${SITE_B_SRM_NAME}.${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest

kafka-consumer-groups --bootstrap-server ${SITE_B_BROKER_ADDRESS} --topic "${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest

kafka-consumer-groups --bootstrap-server ${SITE_B_BROKER_ADDRESS} --topic "${SITE_A_SRM_NAME}.${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest

kafka-console-consumer --bootstrap-server ${SITE_A_BROKER_ADDRESS} --whitelist "(^|\.)${TOPIC_NAME}$" \
	--consumer.config client.properties --timeout-ms 5000 --property 'print.key=true' --property 'key.separator=:' > kafka_messages.txt
