
# 部署

chmod +x ./rebuild.sh

```sql
-- 容器创建成功后，进入mysql容器，给root用户访问权限
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION

-- 查看是否开启了binlog
show variables like 'log_bin';
```

```shell
# 通过查看logs发现报错，在docker-compose.yml中设置mysql密码，不需要加单引号
docker logs mysql1
```

# 参考资料
- [使用docker-compose配置redis服务](https://www.cnblogs.com/xpengp/p/12713374.html)
- [有关使用 Docker 部署 MySQL 服务器的更多主题](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/docker-mysql-more-topics.html)
- [docker-library/mysql](https://github.com/docker-library/mysql/tree/223f0be1213bbd8647b841243a3114e8b34022f4)
- [https://hub.docker.com/_/mysql/](https://hub.docker.com/_/mysql/)