

# 操作步骤
```shell
docker-compose -f create-certs.yml run --rm create_certs
docker-compose up -d


```

设置密码
```
docker exec -it es01 sh
bin/elasticsearch-setup-passwords interactive --verbose
```

# 参考资料
- [run with docker compose](https://www.elastic.co/guide/en/elastic-stack-get-started/7.13/get-started-docker.html#get-started-docker)
- [ Encrypt communications in Kibana](https://www.elastic.co/guide/en/kibana/7.9/configuring-tls.html)
- [Configure Kibana](https://www.elastic.co/guide/en/kibana/7.13/settings.html)
- [Install Elasticsearch with Docker](https://www.elastic.co/guide/en/elasticsearch/reference/7.13/docker.html)
- [docker-compose + elasticsearch7.6(配置密码及证书) + kibana7.6 + elasticsearch-head搭建集群](https://blog.csdn.net/qq_20280007/article/details/108358156)
- [docker-elk](https://github.com/deviantony/docker-elk)
- [配置SSL、TLS以及HTTPS来确保es、kibana、beats、logstash的安全](https://www.cnblogs.com/fat-girl-spring/p/12714845.html)