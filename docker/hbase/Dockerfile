FROM amd64/buildpack-deps:buster-curl as installer

RUN set -x &&\
    curl -SL --output /var/tmp/hbase.tar.gz https://archive.apache.org/dist/hbase/1.4.14/hbase-1.4.14-bin.tar.gz &&\
    tar -xzvf /var/tmp/hbase.tar.gz -C /usr/local &&\
    mv /usr/local/hbase-1.4.14 /usr/local/hbase &&\
    rm -rf /var/tmp/hbase.tar.gz 

FROM chenchongbiao/hadoop:v1
ENV HBASE_HOME=/usr/local/hbase
ENV PATH=$PATH:$HBASE_HOME/bin

WORKDIR $HBASE_HOME

COPY --from=installer ["/usr/local/hbase", "/usr/local/hbase"]