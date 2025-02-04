#!/bin/bash

# This is the script from the Kafka folder

create_topic() {
    # create_topic <topic-name>
    /kafka/bin/kafka-topics.sh \
        --create \
        --zookeeper zookeeper-1:2181 \
        --replication-factor 1 \
        --partitions 3 \
        --topic $1
}

describe_topic() {
    # describe_topic <topic-name>
    /kafka/bin/kafka-topics.sh \
        --describe \
        --topic $1 \
        --zookeeper zookeeper-1:2181
}

list_topics() {
    /kafka/bin/kafka-topics.sh --zookeeper zookeeper-1:2181 --list
}

get_topic_conf() {
    # get_topic_conf <topic-name>
    /kafka/bin/kafka-topics.sh \
        --zookeeper zookeeper-1:2181 \
        --describe \
        --topic $1 | grep Configs
}

delete_topic() {
    # delete_topic <topic-name>
    /kafka/bin/kafka-topics.sh --zookeeper zookeeper-1:2181 --delete --topic $1
}

consume_txt() {
    # consume_txt <topic-name> (This consumption function only serves one bootstrap server)
    /kafka/bin/kafka-console-consumer.sh \
        --bootstrap-server kafka:9092 \
        --timeout-ms 15000 \
        --from-beginning \
        --topic $1
}

produce_txt() {
    # produce_txt <topic-name> <message> (This consumption function only serves one bootstrap server)
    echo $2 | /kafka/bin/kafka-console-producer.sh \
        --broker-list kafka:9092 \
        --topic $1 > /dev/null
}

kafka_help() {
    ls
}