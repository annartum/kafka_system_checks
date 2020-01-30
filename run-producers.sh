source env.sh

./break-replication-paths.sh

for site in SITE_A SITE_B
do
   broker_address_var=${site}_BROKER_ADDRESS
   counter_initial_value_var=${site}_COUNTER_INITIAL_VALUE
   element_count_var=${site}_ELEMENT_COUNT
  ./kafka-produce.sh "${!broker_address_var}" "${!counter_initial_value_var}" "${!element_count_var}"
done

