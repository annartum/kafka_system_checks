source env.sh

for site in SITE_A SITE_B
do
   broker_address_var=${site}_BROKER_ADDRESS
   counter_initial_value_var=${site}_COUNTER_INITIAL_VALUE
  ./kafka_produce "${!site_address_var}" "${!counter_initial_value_var}"
done

