docker run --rm -d -v conf/config:/config --name ss-server-obfs --net=host shadowsocks-obfs -c /config/config.json
