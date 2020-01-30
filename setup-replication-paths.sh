source env.sh

cd /opt/cloudera/parcels/STREAMS_REPLICATION_MANAGER/bin
echo ./srm-control --bootstrap-server ${SITE_B_BROKER_ADDRESS} topics --source "${SITE_A_SRM_NAME}" --target "${SITE_B_SRM_NAME}" --add "${TOPIC_NAME}"
