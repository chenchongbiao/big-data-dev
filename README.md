# Docker构建大数据学习开发环境

### 介绍

#### 1 镜像环境

- 系统：ubuntu 20.04
- Java ：java8

#### 2 镜像介绍

- chenchongbiao/ubuntu20:v1

> 系统ubuntu20.04，安装ssh服务，配置Java环境。

- chenchongbiao/hadoop:v1

> 在ubuntu20:v1镜像上添加了hadoop3.3.1相关环境。

- chenchongbiao/hbase:v1

> 在hadoop:v1镜像添加了hbase1.4.14相关环境。

- chenchongbiao/hive:v1

> 在hbase:v1镜像添加了hive3.1.2相关环境。

#### 3 功能介绍

文件介绍

- build.sh ，在终端运行sudo build.sh构建当前目录的镜像。
- Dockerfile，构建镜像的文本文件。
- standalone.yml，通过sudo docker-compose up -f standalone.yml -d运行单机模式。
- pseudo.yml，通过sudo docker-compose up -f pseudo.yml -d运行伪分布模式。
- cluster.yml，通过sudo docker-compose up -f cluster.yml -d运行分布模式。
- pseudo文件夹，存放伪分布模式下的相关文件。
- cluster文件夹，存放分布模式下的相关文件。
- embed.yml，sudo docker-compose up -f embedcluste.yml -d运行内嵌模式。

#### 4 搭建过程

- [UOS安装Docker及简单使用](https://blog.csdn.net/weixin_45439281/article/details/125930662)
- [UOS安装Docker Compose 及简单使用](https://blog.csdn.net/weixin_45439281/article/details/126021176)
- [Hadoop环境搭建](https://blog.csdn.net/weixin_45439281/article/details/126230105)
- [Hbase环境搭建](https://blog.csdn.net/weixin_45439281/article/details/126264975)
- [Hive环境搭建](https://blog.csdn.net/weixin_45439281/article/details/126352120)
