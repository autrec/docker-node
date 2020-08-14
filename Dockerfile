FROM alpine
#声明作者
LABEL maintainer="a little <mo@autre.cn>"
#升级内核及软件
RUN set -x \
    && apk update \
    && apk upgrade \
    ##设置时区
    ##&& apk --update add --no-cache tzdata \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata
    ## 清除安装软件及缓存
    ##&& rm -rf /tmp/* /var/cache/apk/*
##安装nodejs和npm
##设置环境变量
ENV NODE_ENV production
RUN set -x \
    && apk add nodejs npm \
    && rm -rf /tmp/* /var/cache/apk/*
## 进到应用目录
WORKDIR /var/app
#开放端口
EXPOSE 3000
CMD ["npm","start","daemon off;"]
