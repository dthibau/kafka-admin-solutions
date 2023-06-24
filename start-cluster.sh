#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export KAFKA_DIST=/home/dthibau/Formations/Kafka/MyWork/kafka_2.13-3.5.0
export KAFKA_CLUSTER=/home/dthibau/Formations/Kafka/github/solutions/kafka-cluster
export KAFKA_LOGS=/home/dthibau/Formations/Kafka/MyWork/kafka-logs
export KAFKA_OPTS="-Djavax.net.debug=ssl:handshake:verbose -Djava.security.auth.login.config=/home/dthibau/Formations/Kafka/github/solutions/kafka_server_jaas.conf"


$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-1/server.properties 
$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-2/server.properties 
$KAFKA_DIST/bin/kafka-server-start.sh -daemon $KAFKA_CLUSTER/broker-3/server.properties 
