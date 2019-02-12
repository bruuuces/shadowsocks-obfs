FROM alpine:latest

RUN apk update \
 && apk add --no-cache \
      git \
      autoconf \
      automake \
      build-base \
      c-ares-dev \
      libev-dev \
      libtool \
      libsodium-dev \
      linux-headers \
      mbedtls-dev \
      pcre-dev \
      asciidoc \
      xmlto \
      g++ \
      make \
 && echo "Asia/Shanghai" > /etc/timezone \
 && rm /etc/localtime \
 && git clone https://github.com/shadowsocks/shadowsocks-libev.git /tmp/shadowsocks-libev \
 && cd /tmp/shadowsocks-libev \
 && git submodule update --init --recursive \
 && ./autogen.sh \
 && ./configure \
 && make \
 && make install \
 && git clone https://github.com/shadowsocks/simple-obfs.git /tmp/simple-obfs \
 && cd /tmp/simple-obfs \
 && git submodule update --init --recursive \
 && ./autogen.sh \
 && ./configure \
 && make \
 && make install \
 && apk del \
      git \
      autoconf \
      automake \
      libtool \
      g++ \
      asciidoc \
      xmlto \
      linux-headers \
      make \
 && rm -rf /tmp/shadowsocks-libev \
 && rm -rf /tmp/simple-obfs

ENTRYPOINT ["/usr/local/bin/ss-server"]

