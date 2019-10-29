# Kafka Topic Exporter

Consume Kafka topics and export to Prometheus wrapped in a [docker image](https://hub.docker.com/r/aviyam/kafka-topics-exporter)


### Run the exporter image

```
   docker run -d \
   
```

### Environment variables

```
  # The port for the scraper endpoint
 EXPORTER_PORT [ 12340 ]
 
  # When a metric (name & labels) is not updated for this time period (in second), it will be removed from exporter 
 EXPORTER_METRIC_EXPIRE_SECONDS   [ 0 (no expire) ]
 
  # RegEx for removing substring from Kafka info
 KAFKA_CONSUMER_TOPICS [ export\..* ]
 
  # RegEx for removing substring from Kafka info
 KAFKA_CONSUMER_REMOVE_PREFIX [ EXPORT\. ]

  # Consul server address
 CONSUL_SERVER_URL  \[ default: http://localhost:8500 \]
 
  # Name for Kafka services inside Consul
 CONSUL_KAFKA_SERVICENAME  [  kafka ]
 
  # A list of host/port pairs to use for establishing the initial connection to the Kafka cluster.
  # The client will make use of all servers irrespective of which servers are specified here for bootstrapping
  # this list only impacts the initial hosts used to discover the full set of servers. This list should be in
  # the form <code>host1:port1,host2:port2,...</code>. Since these servers are just used for the initial
  # connection to discover the full cluster membership (which may change dynamically), this list need not
  # contain the full set of servers (you may want more than one, though, in case a server is down).
 BOOTSTRAP_SERVERS   [ localhost:9092 ]
 
 
  # A unique string that identifies the consumer group this consumer belongs to. This property is required if
  # the consumer uses either the group management functionality by using <code>subscribe(topic)</code> or the
  # Kafka-based offset management strategy.
  # kte = kafka-topic-exporter
 GROUP_ID  [ kte-group ]

  # An id string to pass to the server when making requests. The purpose of this is to be able to track the
  # source of requests beyond just ip/port by allowing a logical application name to be included in
  # server-side request logging.
  # kte = kafka-topic-exporter
 CLIENT_ID    [ kte ]
 

```

### Record format

Each record in the topics should be the following format. `timestamp` and `labels` are optional.

```
{
  "name": "<metric_name>",
  "value": <metric_value>,
  "timestamp": <epoch_value_with_millis>,
  "labels: {
    "foolabel": "foolabelvalue",
    "barlabel": "barlabelvalue"
  }
}
```


Then the following item will be exported.

```
<kafka_topic_name>_<metric_name>{foolabel="foolabelvalue", barlabel="barlabelvalue"} <metric_value> <epoch_value>
```
