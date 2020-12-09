FROM alpine:latest

RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*

# 代理端口
EXPOSE 9050
#控制端口
EXPOSE 9051

COPY torrc.default /etc/tor/torrc.default

RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]