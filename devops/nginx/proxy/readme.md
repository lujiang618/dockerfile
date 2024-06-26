
通过nginx实现负载均衡最大的问题在请求是有状态的，期望一个用户一直被负载到同一台服务器上，同时还要均衡。这样轮询(包括加权轮询)，最小连接，最短时间的负载均衡算法都不合适。甚至按照url的负载均衡也不能满足需求。理想的一直方式是，负载之后，所有的请求就不走负载，而是始终用同一台服务器。

如果请求没有状态，那负载均衡就很简单了。

# 负载均衡
- Nginx的ip_hash算法都将一个ip地址的前三段作为hash的关键字， 需要修改nginx代码并重新编译


# 参考资料
- [Nginx 配置之location正则表达](https://blog.csdn.net/yangyelin/article/details/112976539)
- [nginx Rewrite（重写地址）](https://blog.csdn.net/gcc001224/article/details/125000155)
- [Nginx 反向代理 去除 路径匹配规则url](https://blog.csdn.net/A_yonga/article/details/125236208)
- [Nginx 配置之location正则表达](https://blog.csdn.net/yangyelin/article/details/112976539)

- [NGINX中location和proxy_pass后面的 /](https://blog.csdn.net/u010099177/article/details/108629036)

- [Nginx日志格式log_format详解](https://blog.csdn.net/ssk0411/article/details/111317598)
- [nginx的日志 log_format设置](https://blog.csdn.net/zhanghuiqi205/article/details/89417716)
- [nginx时区设置](https://trac.nginx.org/nginx/ticket/2344)
- [Nginx 日志文件 access_log 详解](https://blog.51cto.com/u_10401840/5236654)

- [看完之后太香了！最全面的Nginx知识点总结](https://www.bilibili.com/read/cv7541870/)
- [本文将带领大家精读3个Nginx Lua编程实战案例，学不会就来砍我](https://view.inews.qq.com/a/20220804A0152100)

- [nginx负载均衡状态](https://blog.csdn.net/qq_34939308/article/details/120809539)
- [nginx 负载均衡](https://www.cnblogs.com/mklblog/p/16478798.html)
- [Nginx负载均衡策略之url_hash](https://blog.csdn.net/Leon_Jinhai_Sun/article/details/121153058)