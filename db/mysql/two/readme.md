

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
# 参考资料
