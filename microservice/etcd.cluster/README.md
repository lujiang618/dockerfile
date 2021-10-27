

# etcdctl

```bash
docker exec etcd1 etcdctl set dx '123'
docker exec etcd3 etcdctl get dx
docker exec etcd1 etcdctl ls

docker exec etcd1 etcdctl user.rpc --prefix

```


# 使用步骤
```bash
cd microservice/etcd
docker-compose up -d # 启动容器，第一次会下载image


curl -L http://127.0.0.1:32797/v2/members  # 查看是否安装成功

docker exec -t etcd1 etcdctl member list # 通过etcdctl命令查看集群

docker-compose ps # 查看容器状态

docker-compose stop # 停止容器



```
