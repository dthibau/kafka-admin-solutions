#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export KAFKA_DIST=/home/dthibau/Formations/Kafka/MyWork/kafka_2.13-3.5.0
export KAFKA_CLUSTER=/home/dthibau/Formations/Kafka/github/solutions/kafka-cluster
export KAFKA_LOGS=/home/dthibau/Formations/Kafka/MyWork/kafka-logs
export COMMON_OPTS="-Djavax.net.debug=ssl:handshake:verbose -Djava.security.auth.login.config=/home/dthibau/Formations/Kafka/github/solutions/kafka_server_jaas.conf"


export KAFKA_OPTS="$COMMON_OPTS -javaagent:$PWD/monitoring/jmx_prometheus_javaagent-0.18.0.jar=7071:$PWD/monitoring/kafka_broker.yml"

$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-1/server.properties 

export KAFKA_OPTS="$COMMON_OPTS -javaagent:$PWD/monitoring/jmx_prometheus_javaagent-0.18.0.jar=7072:$PWD/monitoring/kafka_broker.yml"
$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-2/server.properties 

export KAFKA_OPTS="$COMMON_OPTS -javaagent:$PWD/monitoring/jmx_prometheus_javaagent-0.18.0.jar=7073:$PWD/monitoring/kafka_broker.yml"
$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-3/server.properties 

export KAFKA_OPTS="$COMMON_OPTS -javaagent:$PWD/monitoring/jmx_prometheus_javaagent-0.18.0.jar=7074:$PWD/monitoring/kafka_broker.yml"
$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-4/server.properties 
