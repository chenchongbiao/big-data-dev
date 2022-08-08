# Docker构建大数据学习开发环境

### 介绍

#### 1 镜像环境

- 系统：ubuntu 20.04
- Java ：java8

#### 2 镜像介绍

- chenchongbiao/ubuntu20:v1

> 系统ubuntu20.04，安装ssh服务，配置Java环境。

#### 3 功能介绍

文件介绍

- build.sh ，在终端运行sudo build.sh构建当前目录的镜像。
- Dockerfile，构建镜像的文本文件。
- standalone.yml，通过sudo docker-compose up -f standalone.yml -d运行单机模式。
- pseudo.yml，通过sudo docker-compose up -f pseudo.yml -d运行伪分布模式。
- cluster.yml，通过sudo docker-compose up -f cluster.yml -d运行分布模式。
- pseudo文件夹，存放伪分布模式下的配置文件。
- cluster文件夹，存放分布模式下的配置文件。

##### 3.1 ubuntu目录
