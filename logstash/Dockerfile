FROM opensearchproject/logstash-oss-with-opensearch-output-plugin:7.13.4

USER root
COPY --chown=logstash:root config/pipeline.conf config/pipeline.conf
COPY --chown=logstash:root config/entry.sh entry.sh
RUN chmod ug+x entry.sh

EXPOSE 5000
ENTRYPOINT ["/usr/share/logstash/entry.sh"]