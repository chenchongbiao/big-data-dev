FROM amd64/buildpack-deps:buster-curl as installer

# 安装sbt工具
RUN set -x &&\
    curl -SL --output /var/tmp/sbt.tgz https://github.com/sbt/sbt/releases/download/v1.5.5/sbt-1.5.5.tgz  &&\
    tar -xzvf /var/tmp/sbt.tgz -C /usr/local &&\
    rm -rf /var/tmp/sbt.tar.gz 

# 安装maven工具
RUN set -x &&\
    curl -SL --output /var/tmp/maven.tar.gz http://mirrors.aliyun.com/apache/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz?spm=a2c6h.25603864.0.0.5feb2c3aIEQN7l  &&\
    tar -xzvf /var/tmp/maven.tar.gz -C /usr/local &&\
    mv /usr/local/apache-maven-3.8.6 /usr/local/maven &&\
    rm -rf /var/tmp/maven.tar.gz

# 安装spark
RUN  set -x &&\
    curl -SL --output /var/tmp/spark.tar.gz http://mirrors.aliyun.com/apache/spark/spark-3.2.2/spark-3.2.2-bin-without-hadoop.tgz?spm=a2c6h.25603864.0.0.76785afb8rDlcQ && \
    tar -xzvf /var/tmp/spark.tar.gz -C /usr/local/ && \
    mv /usr/local/spark-3.2.2-bin-without-hadoop /usr/local/spark && \
    rm -rf /var/tmp/spark.tar.gz 

FROM chenchongbiao/hive:v1

ENV SPARK_HOME=/usr/local/spark
ENV SBT_HOME=/usr/local/sbt
ENV MAVEN_HOME=/usr/local/maven
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SBT_HOME/bin:$MAVEN_HOME/bin

WORKDIR $SPARK_HOME

COPY --from=installer ["/usr/local/sbt", "/usr/local/sbt"]
COPY --from=installer ["/usr/local/maven", "/usr/local/maven"]
COPY --from=installer ["/usr/local/spark", "/usr/local/spark"]