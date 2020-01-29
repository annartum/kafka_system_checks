export KAFKA_OPTS="-Djava.security.auth.login.config=jaas.conf -Xmx1G"
kafka-consumer-groups --bootstrap-server shared-cdh6-2.dilisim.local:9093  --topic ha_test --command-config client.properties --group ha_test_cg --reset-offsets --to-earliest
kafka-console-consumer --bootstrap-server shared-cdh6-2.dilisim.local:9093 --topic ha_test  --consumer.config client.properties --property 'print.key=true' --property 'key.separator=:' > kafka_messages.txt
