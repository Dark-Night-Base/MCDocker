FROM ubuntu:18.04

LABEL version "0.0.1"
LABEL maintainer "scirocco_gti@yeah.net"

COPY ./MCDReforged/requirements.txt ./

RUN apt update \
    && apt install -y python3 python3-pip \
    && pip3 install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

WORKDIR /data

VOLUME [ "/data" ]

CMD [ "python3", "./MCDReforged.py" ]
