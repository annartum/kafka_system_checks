source env.sh

export PATH="$PATH:/opt/cloudera/parcels/STREAMS_REPLICATION_MANAGER/bin"
srm-control --bootstrap-server ${SITE_B_BROKER_ADDRESS} topics --source "${SITE_A_SRM_NAME}" --target "${SITE_B_SRM_NAME}" --add "${TOPIC_NAME}"
srm-control --bootstrap-server ${SITE_A_BROKER_ADDRESS} topics --source "${SITE_B_SRM_NAME}" --target "${SITE_A_SRM_NAME}" --add "${TOPIC_NAME}"

srm-control --bootstrap-server ${SITE_B_BROKER_ADDRESS} groups --source "${SITE_A_SRM_NAME}" --target "${SITE_B_SRM_NAME}" --add "${CONSUMER_GROUP_NAME}"
srm-control --bootstrap-server ${SITE_A_BROKER_ADDRESS} groups --source "${SITE_B_SRM_NAME}" --target "${SITE_A_SRM_NAME}" --add "${CONSUMER_GROUP_NAME}"


