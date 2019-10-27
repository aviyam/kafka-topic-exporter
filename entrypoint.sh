#!/bin/ash


echo "------ Writing config file ------"

echo exporter.port=$EXPORTER_PORT                                   > config.properties
echo exporter.metrix.expire.seconds=$EXPORTER_METRIX_EXPIRE_SECONDS >> config.properties
echo kafka.consumer.topics=$KAFKA_CONSUMER_TOPICS                   >> config.properties
echo kafka.consumer.remove.prefix=$KAFKA_CONSUMER_REMOVE_PREFIX     >> config.properties
echo consul.server.url=$CONSUL_SERVER_URL                           >> config.properties
echo consul.kafka.servicename=$CONSUL_KAFKA_SERVICENAME             >> config.properties
echo bootstrap.servers=$BOOTSTRAP_SERVERS							              >> config.properties
echo group.id=$GROUP_ID                                             >> config.properties


echo exporter.port=$EXPORTER_PORT
echo exporter.metrix.expire.seconds=$EXPORTER_METRIX_EXPIRE_SECONDS
echo kafka.consumer.topics=$KAFKA_CONSUMER_TOPICS
echo kafka.consumer.remove.prefix=$KAFKA_CONSUMER_REMOVE_PREFIX
echo consul.server.url=$CONSUL_SERVER_URL
echo consul.kafka.servicename=$CONSUL_KAFKA_SERVICENAME
echo bootstrap.servers=$BOOTSTRAP_SERVERS
echo group.id=$GROUP_ID

echo "----- Starting exporter --------"
exec "$@"
