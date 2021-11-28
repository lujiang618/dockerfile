

```
# 获取es7在网络some内的地址
docker exec -it jaeger-collector ping es7

```

# 注意
- jaeger-query的16685端口 conn refuse， [16685资料](https://www.jaegertracing.io/docs/1.28/deployment/)

# 访问jaeger界面
localhost:16686


# 参考资料
- [docker compose安装Jaeger 1.18](https://blog.csdn.net/qqq125536039/article/details/107046465)
- [jaege使用elasticsearch存储docker安装](https://www.cnblogs.com/zhangb8042/p/14421219.html)