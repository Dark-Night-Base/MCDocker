FROM openjdk:8u212-jre-alpine

LABEL version="0.0.1"
LABEL maintainer="scirocco_gti@yeah.net"

EXPOSE 25565

# hook into docker BuildKit --platform support
# see https://docs.docker.com/engine/reference/builder/#automatic-platform-args-in-the-global-scope
ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG TARGETVARIANT=""

COPY MCDReforged/requirements.txt ./
COPY mcstatus /usr/local/bin

RUN apt update \
    && apt install -y python3 python3-pip \
    && pip3 install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

WORKDIR /data

ENV ENABLE_AUTOPAUSE=false AUTOPAUSE_TIMEOUT_EST=3600 AUTOPAUSE_TIMEOUT_KN=120 \
    AUTOPAUSE_TIMEOUT_INIT=600 AUTOPAUSE_PERIOD=10

COPY start* /
COPY health.sh /
ADD autopause /autopause

VOLUME [ "/data" ]

RUN chmod +x /start* && chmod +x /health.sh && chmod +x /autopause/*.sh

ENTRYPOINT [ "/start" ]
HEALTHCHECK --start-period=1m CMD /health.sh
