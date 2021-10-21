

# 部署
```
docker-compose up -d
docker exec rabbitmq sh -c 'exec rabbitmq-plugins enable rabbitmq_management' # 激活web页面
```
访问： http://localhost:15672/ 



# 参考资料
- [docker-compose部署rabbitmq](https://www.jianshu.com/p/5aa610e6ffa5)