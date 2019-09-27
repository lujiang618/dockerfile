
# 说明
快速构建php开发环境

# 构建镜像的内容
+ docker
+ alpine
+ php5.6
+ nginx
+ composer
+ supervisor
+ crontab

# 生成容器
```
git clone git@github.com:lujiang618/dockerfile.git
cd dockerfile/php5.6+nginx

docker build -t php56:1.0 .

docker run -d -p 9801:9801 \
-v /docker/nginx/conf/:/etc/nginx/conf.d/ \
-v /www/lifemall:/www  --privileged=true \
--name project php56:1.0

# 测试 访问 127.0.0.1:9801

```



# TODO
- [ ] redis
- [ ] mongodb
- [ ] memcached