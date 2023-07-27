# Logstash lab for testing pipelines
## Prerequisites
- Docker

## Installation
1. Clone this repository
```shell
git clone https://github.com/dariommr/logstash-lab.git
cd logstash-lab
```
2. Build the images
```shell
docker build -t logstash-lab logstash/.
docker build -t logstash-lab filebeat/.
```
3. Modify `the docker-compose.yml` file to configure the `INDEXER_IP`, `LOGSTASH_KS_USER`, `LOGSTASH_KS_PASS` environment variables.
4. Run `docker compose up -d` to start the containers

## How to use it
1. Execute bash in interactive mode in the Filebeat docker container
```shell
docker exec -ti logstash-lab-filebeat-1 bash
```
2. Once inside the container you can test it by running this command:
```shell
echo '{"timestamp":"2023-07-27T13:00:00.000-0300","rule":{"level":9,"description":"Logstash Test Alert","id":"999999","firedtimes":99,"mail":false,"groups":["logstash-test"]},"agent":{"id":"999","name":"NO-AGENT","ip":"1.2.3.4"},"manager":{"name":"no-manager"},"id":"1690476900.3546161","cluster":{"name":"no-cluster","node":"node01"},"decoder":{"name":"json"},"data":{"logstash-test":{"object-field":{"Subfield01":"value01","Subfield02":"value02"},"text-field":"value","numeric-field":"9.9","boolean-field":true}},"location":"logstash-test"}' >>input.json
```
This will add a json line to the `input.json` file which is read by the Filebeat service and sent to the Logstash container.

What you should see on the indexer:
![image](https://github.com/dariommr/logstash-lab/assets/37050249/582259ec-a0c4-460e-a3b2-013d0930e7ef)
