FROM ubuntu:18.04
LABEL maintainer="Jaeho Lee <jhlee21071@gmail.com>"

USER root

# 기본 패키지 설치
RUN apt-get update && apt-get -y install \
    vim-tiny \
    net-tools \
    iputils-ping \
    iptables \
    openvpn \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/

RUN chmod 775 \
  /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]