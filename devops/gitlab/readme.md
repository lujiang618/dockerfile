

```
docker volume rm gitlab_config gitlab_data gitlab_log

```
# 初始化root密码
```
docker exec -it gitlab gitlab-rails console -e production

gitlab-rails console -e production
u=User.where(id:1).first
u.password='12345678'
u.password_confirmation='12345678'
u.save!
exit

```

# 数据备份和恢复
```
docker exec -it gitlab gitlab-rake gitlab:backup:create
docker exec -it gitlab gitlab-rake gitlab:backup:restore BACKUP=1530156812_2018_06_28_10.8.4
```

# 访问
url: http://gitlab.flower.com:8100/users/sign_in 通过root账号登录

# todo
- [ ] 配置ssl
- [ ] 配置邮箱

# 参考资料
- [官方文档](https://docs.gitlab.com/ee/install/docker.html#install-gitlab-using-docker-compose)
- [Linux初装Gitlab14重置web登录root密码](https://blog.csdn.net/timonium/article/details/119450240)
- [Docker折腾记: (3)Docker Compose构建Gitlab,从配置(https,邮箱验证)到基本可用](https://blog.csdn.net/crper/article/details/81291034)
- [https://www.centoscn.vip/2816.html](https://www.centoscn.vip/2816.html)
- [Docker 搭建 GitLab-ssl](https://blog.csdn.net/qq_36381626/article/details/115320681)
- [正确使用 Docker 搭建 GitLab 只要半分钟](https://zhuanlan.zhihu.com/p/49499229)