#!/bin/ash


echo "------ Writing config file ------"

echo EXPORTER_PORT=$EXPORTER_PORT									> config.properties
echo EXPORTER_METRIX_EXPIRE_SECONDS=$EXPORTER_METRIX_EXPIRE_SECONDS	>> config.properties
echo KAFKA_CONSUMER_TOPICS=$KAFKA_CONSUMER_TOPICS					>> config.properties
echo KAFKA_CONSUMER_REMOVE_PREFIX=$KAFKA_CONSUMER_REMOVE_PREFIX		>> config.properties
echo CONSUL_SERVER_URL=$CONSUL_SERVER_URL							>> config.properties
echo CONSUL_KAFKA_SERVICENAME=$CONSUL_KAFKA_SERVICENAME				>> config.properties
echo BOOTSTRAP_SERVERS=$BOOTSTRAP_SERVERS							>> config.properties
echo GROUP_ID=$GROUP_ID												>> config.properties


echo EXPORTER_PORT=$EXPORTER_PORT
echo EXPORTER_METRIX_EXPIRE_SECONDS=$EXPORTER_METRIX_EXPIRE_SECONDS
echo KAFKA_CONSUMER_TOPICS=$KAFKA_CONSUMER_TOPICS
echo KAFKA_CONSUMER_REMOVE_PREFIX=$KAFKA_CONSUMER_REMOVE_PREFIX
echo CONSUL_SERVER_URL=$CONSUL_SERVER_URL
echo CONSUL_KAFKA_SERVICENAME=$CONSUL_KAFKA_SERVICENAME
echo BOOTSTRAP_SERVERS=$BOOTSTRAP_SERVERS
echo GROUP_ID=$GROUP_ID

echo "----- Starting exporter --------"
exec "$@"