kafka-run-class -Djava.security.auth.login.config=jaas.conf org.apache.kafka.tools.ProducerPerformance \
	--throughput 100000000 --producer.config client.properties --num-records 200000000 \
	--record-size 2048 --topic ${TOPIC_NAME} \
	--producer-props bootstrap.servers=${SITE_A_BROKER_ADDRESS}
