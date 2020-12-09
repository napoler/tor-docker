FROM alpine:3.5
LABEL maintainer "Terry Chan <napoler2008@gmail.com>"

RUN apk add --no-cache tor
ADD torrc /etc/tor/torrc
VOLUME "/var/lib/tor"
# 代理端口
EXPOSE 9050
#控制端口
EXPOSE 9051
USER tor
ENTRYPOINT /usr/bin/tor -f /etc/tor/torrc