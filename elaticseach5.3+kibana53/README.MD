

# 说明
通过compose-compose快速构建kibana5.3+essticsearch5.3的容器，HTTP认证的用户和密码是elastic changeme


# 构建容器
```
# 安装docker-compose
yum -y install epel-release python-pip
pip install --upgrade pip
pip install --upgrade backports.ssl_match_hostname
pip install docker-compose
docker-compose -version

# 创建并启动容器
docker-compose up -d

# 关闭容器
docker-compose down

```

# 测试
```
# 输入密码changeme
curl -u elastic http://192.168.132:9200/_cat/health
```


# 参考资料
- https://www.elastic.co/guide/en/kibana/5.3/_configuring_kibana_on_docker.html
- https://www.elastic.co/guide/en/elasticsearch/reference/5.3/docker.html