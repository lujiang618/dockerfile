
# 说明
快速构建php开发环境

# 构建镜像的内容
+ docker
+ alpine
+ php7.0
+ nginx
+ composer
+ supervisor
+ crontab

# 生成容器
```
git clone git@github.com:lujiang618/dockerfile.git
cd dockerfile/php7+nginx

docker build -t php7:1.0 .

docker run -d \
-p 9802:9802 \
--restart=always \
-m 2g \
--cpuset-cpus=0 \
--cpu-shares 1024 \
-v /docker/nginx/mall/:/etc/nginx/conf.d/ \
-v /www/lifemall:/www  --privileged=true \
--name project php7:1.0

# 测试 访问 127.0.0.1:9802

```



# TODO
- [ ] redis
- [ ] mongodb
- [ ] memcached