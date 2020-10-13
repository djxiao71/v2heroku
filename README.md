## 概述

在 Heroku 上部署 V2Ray Websocket。

**Heroku 的网络并不稳定，部署前请三思，本项目也不宜做为长期翻墙使用。**

可以部署两个以上的应用，实现 [负载均衡](https://toutyrater.github.io/app/balance.html)，避免长时间大流量连接某一应用而被 Heroku 判定为滥用。


## 部署

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


### ENV 设定

`VER` > `V2Ray 的版本，如果为 latest，则会自动使用最新版本`。

`PROTOCOL` > `vless 协议还在测试，且版本 ≥ 4.27.0 时才能使用。所以默认为 vmess`。

`UUID` > `供用户连接时验证身份使用，默认为 ad806487-2d26-4636-98b6-ab85cc8521f7`。

`PATH` > `WebSocket模式下的路径，默认为 /`。


### 注意

> 1. 部署VMess协议时，`alterId`为`64`。
> 2. 服务端部署后，应`open app`，显示`Bad Request`，表示部署成功。
> 3. 客户端可使用`Websocket`端口`80`，或`Websocket+TLS`端口`443`传输。
> 4. 出于安全考量，除非使用 CDN，否则不要使用自定义域名，而使用 Heroku 分配的二级域名，以实现 V2Ray Websocket + TLS。

## 参考

https://github.com/bclswl0827/v2ray-heroku

https://github.com/giegloop/ng-hr