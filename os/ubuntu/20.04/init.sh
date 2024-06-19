#/usr/bin/bash

# 删除ubuntu自带的docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do apt-get remove $pkg; done

# 安装docker
apt-get update
apt-get install -y ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker version

docker compose version

# 开机启动
systemctl enable docker

docker network create some

# 安装redis
docker compose -f docker-compose-redis.yml down
docker compose -f docker-compose-redis.yml up -d
docker compose -f docker-compose-redis.yml ps

# 安装redis客户端工具
snap install redisinsight

# 安装etcd
docker compose -f docker-compose-etcd.yml down
docker compose -f docker-compose-etcd.yml up -d
docker compose -f docker-compose-etcd.yml ps

# 安装etcd客户端工具
snap install etcd-manager
