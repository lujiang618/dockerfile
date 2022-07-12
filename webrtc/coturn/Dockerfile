FROM ubuntu:20.04
LABEL stage=dxyp-coturn

ADD ./sources.list /etc/apt/sources.list

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y openssl libssl-dev libevent-dev  sqlite libsqlite3-dev net-tools

WORKDIR /coturn

ADD ./coturn /coturn
ADD conf/turnserver.conf /coturn/etc/turnserver.conf
ADD ./coturn.sh ./

RUN chmod +x ./coturn.sh

ENV TZ=Asia/Shanghai
ENV PATH=$PATH:/coturn/bin

EXPOSE 3478/udp

ENTRYPOINT ["./coturn.sh"]