
# 初始化root密码
```
# 进入容器内部
# docker exec -i gitlab sh -c 'exec gitlab-rails console -e production'  # 好像也可以吧
docker exec -it gitlab sh 

gitlab-rails console -e production
u=User.where(id:1).first
u.password='12345678'
u.password_confirmation='12345678'
u.save!
exit

```

# 访问
url: http://gitlab.flower.com:8100/users/sign_in 通过root账号登录

# 参考资料
- [官方文档](https://docs.gitlab.com/ee/install/docker.html#install-gitlab-using-docker-compose)
- [Linux初装Gitlab14重置web登录root密码](https://blog.csdn.net/timonium/article/details/119450240)