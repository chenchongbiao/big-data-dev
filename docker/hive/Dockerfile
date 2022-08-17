FROM amd64/buildpack-deps:buster-curl as installer

RUN set -x &&\
    curl -SL --output /var/tmp/hive.tar.gz http://mirrors.aliyun.com/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz?spm=a2c6h.25603864.0.0.1abd75c3wmTVAf  &&\
    tar -xzvf /var/tmp/hive.tar.gz -C /usr/local &&\
    mv /usr/local/apache-hive-3.1.2-bin /usr/local/hive &&\
    rm -rf /var/tmp/hive.tar.gz 

FROM chenchongbiao/hbase:v1

RUN mkdir -p /usr/hive/warehouse && mkdir -p /usr/hive/log
ENV HIVE_HOME=/usr/local/hive
ENV PATH $HIVE_HOME/bin:$PATH

WORKDIR $HIVE_HOME

COPY --from=installer ["/usr/local/hive", "/usr/local/hive"]