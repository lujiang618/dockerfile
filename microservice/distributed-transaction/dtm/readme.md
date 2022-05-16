

分布式事务管理器dtm

# 部署步骤
1.创建相关的数据库表
2.通过环境变量配置启动dtm容器（推荐）

# 初始化数据库

```
gic clone git@github.com:dtm-labs/dtm.git
cd dtm/sqls
docker exec -i mysql mysql -u root -proot --default-character-set=utf8mb4 < dtmcli.barrier.mysql.sql
docker exec -i mysql mysql -u root -proot --default-character-set=utf8mb4 < dtmsvr.storage.mysql.sql
docker exec -i mysql mysql -u root -proot --default-character-set=utf8mb4 < busi.mysql.sql # dtm的demo用到这个库
```

# 环境变量

环境变量采用大写+下划线的格式，除了首字母之外的其他大写字母前加下划线， 具体参考：[conf.sample.yml](https://github.com/dtm-labs/dtm/conf.sample.yml)

启动成功后加载的配置文件
```
{
  "Store": {
    "Driver": "mysql",
    "Host": "172.17.0.1",
    "Port": 3306,
    "User": "root",
    "Password": "root",
    "MaxOpenConns": 500,
    "MaxIdleConns": 500,
    "ConnMaxLifeTime": 5,
    "DataExpire": 604800,
    "RedisPrefix": "{a}",
    "TransGlobalTable": "dtm.trans_global",
    "TransBranchOpTable": "dtm.trans_branch_op"
  },
  "TransCronInterval": 10,
  "TimeoutToFail": 10,
  "RetryInterval": 10,
  "HttpPort": 36789,
  "GrpcPort": 36790,
  "MicroService": {
    "Driver": "dtm-driver-gozero",
    "Target": "etcd://172.17.0.1:2379/dtmservice",
    "EndPoint": "localhost:36790"
  },
  "UpdateBranchSync": 0,
  "LogLevel": "info"
}
```

# 参考资料
- [docker部署](https://dtm.pub/deploy/docker.html)
