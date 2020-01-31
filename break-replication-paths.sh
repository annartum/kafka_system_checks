source env.sh

export PATH="$PATH:/opt/cloudera/parcels/STREAMS_REPLICATION_MANAGER/bin"
srm-control --bootstrap-server ${SITE_B_BROKER_ADDRESS} topics --source "${SITE_A_SRM_NAME}" --target "${SITE_B_SRM_NAME}" --remove "${TOPIC_NAME}"
srm-control --bootstrap-server ${SITE_A_BROKER_ADDRESS} topics --source "${SITE_B_SRM_NAME}" --target "${SITE_A_SRM_NAME}" --remove "${TOPIC_NAME}"

srm-control --bootstrap-server ${SITE_B_BROKER_ADDRESS} groups --source "${SITE_A_SRM_NAME}" --target "${SITE_B_SRM_NAME}" --remove "${CONSUMER_GROUP_NAME}"
srm-control --bootstrap-server ${SITE_A_BROKER_ADDRESS} groups --source "${SITE_B_SRM_NAME}" --target "${SITE_A_SRM_NAME}" --remove "${CONSUMER_GROUP_NAME}"

kafka-topics --delete --bootstrap-server ${SITE_B_BROKER_ADDRESS} --command-config client.properties --topic "${TOPIC_NAME}"
kafka-topics --delete --bootstrap-server ${SITE_B_BROKER_ADDRESS} --command-config client.properties --topic "${SITE_A_SRM_NAME}.${TOPIC_NAME}"

kafka-topics --delete --bootstrap-server ${SITE_A_BROKER_ADDRESS} --command-config client.properties --topic "${TOPIC_NAME}"
kafka-topics --delete --bootstrap-server ${SITE_A_BROKER_ADDRESS} --command-config client.properties --topic "${SITE_B_SRM_NAME}.${TOPIC_NAME}"

echo "LISTING TOPICS WITH ${TOPIC_NAME} ON ${SITE_A_SRM_NAME}"
kafka-topics --list --bootstrap-server ${SITE_A_BROKER_ADDRESS} --command-config client.properties 2>/dev/null | grep "${TOPIC_NAME}"

echo "LISTING TOPICS WITH ${TOPIC_NAME} ON ${SITE_B_SRM_NAME}"
kafka-topics --list --bootstrap-server ${SITE_B_BROKER_ADDRESS} --command-config client.properties 2>/dev/null | grep "${TOPIC_NAME}"

