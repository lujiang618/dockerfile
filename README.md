
# 说明
分享一下自己的dockerfile。目前实现了mysql单机，主从；redis单机，集群；es,kibana,elk; 配置中心的apollo,nacos，分布式事务的dtm；etcd集群；监控系统的prometheus，grafana；链路追踪的jaeger，zipkin等


# 端口号分配
| 端口 | 容器 |
| -- | -- | 
| 8101 | gitlab |
| 8110 | jenkins |
| 8200 | etcd  |





# 实现的dockerfile
+ [php5.6 + ngnix](php/php5.6+nginx/README.md)
+ [kibana5.3 + elasticseach5.3](db/elaticseach7.3.2+kibana7.3.2/readme.md)
+ [mysql5.7+redis](db/mysql5.7.34+redis/readme.md)
+ [php7.2+nginx](php/php7/README.md)
+ [genkins](jenkins/readme.md)
+ [gitlab](gitlab/readme.md)
+ [基础服务的docker-compose配置文件](https://gitee.com/zxx95/docker-compose)


# 常用工具
- [hub.docker.com](https://hub.docker.com/)