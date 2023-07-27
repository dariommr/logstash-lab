FROM docker.elastic.co/beats/filebeat-oss:7.13.4

COPY --chown=filebeat:root config/filebeat.yml /usr/share/filebeat/filebeat.yml
COPY --chown=filebeat:root config/input.json /usr/share/filebeat/input.json
COPY --chown=filebeat:root config/entry.sh entry.sh
RUN chmod ug+x entry.sh

ENTRYPOINT ["entry.sh"]