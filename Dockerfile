FROM alpine
#声明作者
LABEL maintainer="node docker Autre <mo@autre.cn>"
#升级内核及软件
RUN apk update \
    && apk upgrade \
    ##设置时区
    && apk --update add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata \
    ## 清除安装软件及缓存
    && rm -rf /tmp/* /var/cache/apk/*
##安装nginx
RUN apk --update add --no-cache nginx \
    && rm -rf /tmp/* /var/cache/apk/* \
    ## 创建网站和日志目录
    && mkdir -p /var/app


#开放端口
EXPOSE 3000
CMD ["npm","start","daemon off;"]
