#!/bin/bash
echo -e "Configuring Logstash...\n"
sed -i "s/INDEXER_IP/$INDEXER_IP/g" config/pipeline.conf
sed -i "s/LOGSTASH_KS_USER/$LOGSTASH_KS_USER/g" config/pipeline.conf
sed -i "s/LOGSTASH_KS_PASS/$LOGSTASH_KS_PASS/g" config/pipeline.conf

echo -e "Executing Logstash...\n"
exec logstash -f config/pipeline.conf --config.reload.automatic