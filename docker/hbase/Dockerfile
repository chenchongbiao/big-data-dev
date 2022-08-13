FROM amd64/buildpack-deps:buster-curl as installer

RUN set -x &&\
    curl -SL --output /var/tmp/hbase.tar.gz http://mirrors.aliyun.com/apache/hbase/2.4.13/hbase-2.4.13-bin.tar.gz?spm=a2c6h.25603864.0.0.1ff092c5wfx4JS  &&\
    tar -xzvf /var/tmp/hbase.tar.gz -C /usr/local &&\
    mv /usr/local/hbase-2.4.13 /usr/local/hbase &&\
    rm -rf /var/tmp/hbase.tar.gz 

FROM chenchongbiao/hadoop:v1
ENV HBASE_HOME=/usr/local/hbase
ENV PATH=$PATH:$HBASE_HOME/bin

WORKDIR $HBASE_HOME

COPY --from=installer ["/usr/local/hbase", "/usr/local/hbase"]