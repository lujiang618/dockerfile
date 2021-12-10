
1. network_mode: "host"
2. 集群是主主机群+主从集群的模式
3. Redis集群下只有db0,不支持多db, [官方说明](https://redis.io/topics/cluster-spec)
![img](https://upload-images.jianshu.io/upload_images/20671991-1858c9d30b433f27.png?imageMogr2/auto-orient/strip|imageView2/2/w/1191/format/webp)

# 构建集群
```
docker exec -it redis1 redis-cli --cluster create 192.168.100.21:6360 192.168.100.21:6361 192.168.100.21:6362 192.168.100.21:6363 192.168.100.21:6364 192.168.100.21:6365 --cluster-replicas 1
```

[redis.conf download](http://download.redis.io/redis-stable/redis.conf)

# 参考资料
- [基于docker-compose搭建redis集群](https://blog.csdn.net/fd214333890/article/details/111007824)
- [docker-compose组建带密码redis集群 完整版](https://blog.csdn.net/alinyua/article/details/80936940)
- [Redis高可用集群模式](https://www.jianshu.com/p/b951bf34cee5)
- [redis 主从模式，哨兵模式，cluster(集群)模式 简介](https://blog.csdn.net/qq_28410283/article/details/89197156)
- [Redis模式对比：主从模式 VS 哨兵sentinel模式 VS Redis cluster模式](https://zhuanlan.zhihu.com/p/160933527)