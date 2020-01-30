source env.sh

for site in SITE_A SITE_B
do
  export BROKER_ADDRESS=$!{${site}_BROKER_ADDRESS}
  echo ${BROKER_ADDRESS}
done

