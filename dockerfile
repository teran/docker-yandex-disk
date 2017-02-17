FROM debian:jessie
MAINTAINER Mitry Pyostrovsky <mitrypyostrovsky@gmail.com>

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get clean
RUN apt-get install -y wget locales && \
    apt-get clean

RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && \
    wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add - && \
    apt-get update && \
    apt-get install -y yandex-disk && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

RUN echo 'ru_RU.UTF-8 UTF-8' > /etc/locale.gen && \
    locale-gen --purge ru_RU.UTF-8

ENV LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8

ENTRYPOINT ["/usr/bin/yandex-disk"]