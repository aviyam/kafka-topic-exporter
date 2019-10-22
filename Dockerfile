from openjdk:8-jre-alpine

ENV EXPORTER_PORT=12340
ENV EXPORTER_METRIX_EXPIRE_SECONDS=60
ENV KAFKA_CONSUMER_TOPICS=export\..*
ENV KAFKA_CONSUMER_REMOVE_PREFIX=EXPORT\.
ENV CONSUL_SERVER_URL=http://localhost:8500
ENV CONSUL_KAFKA_SERVICENAME=kafka
ENV BOOTSTRAP_SERVERS=localhost:9092
ENV GROUP_ID=kte-group
ENV CLIENT_ID=kte

WORKDIR /exporter
COPY target/kafka-topic-exporter-0.0.6-jar-with-dependencies.jar kafka-topics-exporter.jar
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/exporter/entrypoint.sh"]

CMD ["java", "-jar","kafka-topics-exporter.jar","config.properties"]
