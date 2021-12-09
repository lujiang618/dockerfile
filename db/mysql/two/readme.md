

一主一从

```shell
-- 如果出现异常，删除mysql的数据和log
docker volume rm two_master_data two_master_log two_slave_data two_slave_log
sudo ls -l /var/lib/docker/volumes/two_master_data/_data

-- 显示docker构建的局域网
docker network inspect some
```

master
```sql
show variables like '%server_id%';
show master status;
show databases;

create database some;
```

slave
```sql
show variables like '%server_id%';
show slave status;
SHOW VARIABLES LIKE '%read_only%'; #查看只读状态

show databases;
```

# 注意
mysql 5.7.35版本自带了ssl的证书
```
show variables like '%ssl%';
```
# 参考资料
- [mysql启动时的几个warning解决方法](https://blog.csdn.net/jolly10/article/details/80346784)