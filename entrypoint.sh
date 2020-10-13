#!/bin/sh

mkdir /v2ray
cd /v2ray

# Download V2Ray
if [ "$VER" = "latest" ]; then
  wget --no-check-certificate -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
else
  wget --no-check-certificate -O v2ray.zip http://github.com/v2fly/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
fi

unzip v2ray.zip

# chmod +x 给与文件执行权限
chmod +x v2ray v2ctl

if [ "$PROTOCOL" = "vless" ]; then
  # cp 是复制，-f 是强制复制
  cp -f /server_config_vless.json config.json
else
  cp -f /server_config_vmess.json config.json
fi

# sed -i 就是直接对文本文件进行操作
# sed -i 's/原字符串/新字符串/g' 文件地址
sed -i "s/your_uuid/$UUID/g" config.json
sed -i "s/your_path/$PATH/g" config.json

# nohup 加在一个命令的最前面，表示不挂断的运行命令
# & 加在一个命令的最后面，表示这个命令放在后台执行
nohup ./v2ray &