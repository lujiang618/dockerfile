#/bin/bash
# coturn本地部署，外网访问需要在nat上做映射指向到本机 

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y gcc openssl libssl-dev libevent-dev sqlite libsqlite3-dev 

projectPath="$PWD"

if [ -f 4.5.2-r12.tar.gz ]
then
    sudo rm 4.5.2-r12.tar.gz
fi

wget https://github.com/coturn/coturn/archive/refs/tags/docker/4.5.2-r12.tar.gz
tar xvf 4.5.2-r12.tar.gz
cd coturn-docker-4.5.2-r12

# --prefix可以按需要修改
./configure --prefix=${projectPath}/coturn
make
sudo make install

cd ../

docker build --no-cache -t coturn:v0.1 -f dockers/CoTurnDockerfile .
docker build -t coturn:v0.1 .
docker rm -f coturn
# 需要指定公网IP地址环境变量，并映射出端口
docker run -d -p 3478:3478/udp -e PUBLIC_IP=116.232.151.182 --name=coturn coturn:v0.1 --privileged=true

sudo rm  4.5.2-r12.tar.gz
sudo rm -rf coturn coturn-docker-4.5.2-r12