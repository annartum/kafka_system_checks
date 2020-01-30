source env.sh

for site in SITE_A SITE_B
do
  site_address_var=${site}_BROKER_ADDRESS
  export BROKER_ADDRESS=${!site_address_var}

  echo "Creating topics and running producers for ${site}"
  ./kafka-produce.sh
  echo ${BROKER_ADDRESS}
done

