FROM amd64/buildpack-deps:buster-curl as installer

RUN set -x &&\
    curl -SL --output /var/tmp/hadoop.tar.gz https://mirrors.aliyun.com/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz?spm=a2c6h.25603864.0.0.ab0a5b418AUU3w &&\
    tar -xzvf /var/tmp/hadoop.tar.gz -C /usr/local &&\
    mv /usr/local/hadoop-3.3.1 /usr/local/hadoop &&\
    rm -rf /var/tmp/hadoop.tar.gz 

FROM chenchongbiao/ubuntu20:v1

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH
WORKDIR $HADOOP_HOME

COPY --from=installer ["/usr/local/hadoop", "/usr/local/hadoop"]