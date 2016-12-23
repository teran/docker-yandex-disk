FROM debian:jessie
MAINTAINER Igor Shishkin <me@teran.ru>

RUN apt-get update && \
    apt-get dist-upgrade -y
RUN apt-get install -y wget locales
RUN locale-gen --purge en_US.UTF-8 && \
    echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale
RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && \
    wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add - && \
    apt-get update && \
    apt-get install -y yandex-disk

ENTRYPOINT ["/usr/bin/yandex-disk"]
