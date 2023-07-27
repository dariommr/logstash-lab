#!/bin/bash
echo -e "Configuring Filebeat...\n"
sed "s/LOGSTASH_IP/$LOGSTASH_IP/g" filebeat.yml > /tmp/filebeat.yml && cat /tmp/filebeat.yml > filebeat.yml

echo -e "Executing Filebeat...\n"
exec filebeat -e