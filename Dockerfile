FROM alpine:3.5

RUN apk add --no-cache --virtual .build-deps ca-certificates wget unzip

COPY server_config_vmess.json /server_config_vmess.json
COPY server_config_vless.json /server_config_vless.json
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh