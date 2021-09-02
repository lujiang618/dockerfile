
# 部署
```
chmod +x ./rebuild.sh

-- 容器创建成功后，进入mysql容器，给root用户访问权限
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION

```

# 参考资料
- [使用docker-compose配置redis服务](https://www.cnblogs.com/xpengp/p/12713374.html)