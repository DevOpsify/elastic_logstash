#!/bin/bash

# take type from environment
CONF_FILE=/config-dir/logstash_$type.conf

# NUM_OF_WORKER, REDIS_HOST and ELASTICSEARCH_HOST
# are from DEEP tool

sed -i "s#REDIS_HOST#$REDIS_HOST#" $CONF_FILE
sed -i "s#ELASTICSEARCH_HOST#$ELASTICSEARCH_HOST#" $CONF_FILE

/docker-entrypoint.sh logstash agent -w $NUM_OF_WORKER -f $CONF_FILE
