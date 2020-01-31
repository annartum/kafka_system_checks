source env.sh

for site in SITE_A SITE_B
do
  broker_address_var=${site}_BROKER_ADDRESS

  kafka-consumer-groups --bootstrap-server ${!broker_address_var} --topic "${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest --execute 

  kafka-consumer-groups --bootstrap-server ${!broker_address_var} --topic "${SITE_A_SRM_NAME}.${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest --execute

  kafka-consumer-groups --bootstrap-server ${!broker_address_var} --topic "${SITE_B_SRM_NAME}.${TOPIC_NAME}" --command-config client.properties --group ${CONSUMER_GROUP_NAME} --reset-offsets --to-earliest --execute

  kafka-console-consumer --bootstrap-server ${!broker_address_var} --whitelist "(^|\.)${TOPIC_NAME}$" \
        --consumer.config client.properties --timeout-ms 5000 --property 'print.key=true' --property 'key.separator=:' > ${site}_data.txt
done
