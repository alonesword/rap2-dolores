# 拉取 10.1.0(为了保持和后端一致，取 8.11.1-alpine镜像) 版本的 node镜像
#FROM node:8.11.1-alpine
FROM node:10.1.0

# 维护人
MAINTAINER alonesword

# 创建工作目录
RUN mkdir -p /home/rap2-dolores
WORKDIR /home/rap2-dolores

# 将代码拷贝至工作目录
COPY . /home/rap2-dolores

RUN npm config set registry https://registry.npm.taobao.org && npm config get registry && npm install -g http-server && npm install --unsafe-perm -g node-sass && npm install && npm run build

# 安装 taobao 的 repository
# RUN npm install -g cnpm --registry=https://registry.npm.taobao.orgi

## 全局安装 http-server 服务器
#RUN npm install -g http-server
#
## 全局安装 node-sass()
#RUN npm install --unsafe-perm -g node-sass
#
## 安装依赖
#RUN npm install
#
## 打包
#RUN npm run build
