FROM amd64/buildpack-deps:buster-curl as installer

# 安装Java环境
RUN wget https://repo.huaweicloud.com/java/jdk/8u151-b12/jdk-8u151-linux-x64.tar.gz && \
    tar -zxvf jdk-8u151-linux-x64.tar.gz -C /usr/local/ && \
    mv /usr/local/jdk1.8.0_151 /usr/local/jdk1.8 && \
    rm -rf /usr/local/jdk-8u151-linux-x64.tar.gz

FROM ubuntu:20.04 

ENV TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8"
RUN echo 	"deb http://mirrors.163.com/ubuntu/ focal main restricted universe multiverse\n \
			deb http://mirrors.163.com/ubuntu/ focal-security main restricted universe multiverse \n \
			deb http://mirrors.163.com/ubuntu/ focal-updates main restricted universe multiverse\n	\
			deb http://mirrors.163.com/ubuntu/ focal-backports main restricted universe multiverse\n"\
            > /etc/apt/sources.list        \
            && apt update && apt install -y \ 
			openssh-server \
			vim \
			&& apt clean \
			&& rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp* \
			&& ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
			&& sed -i 's/PermitEmptyPasswords yes/PermitEmptyPasswords no /' /etc/ssh/sshd_config  \
			&& sed -i 's/PermitRootLogin without-password/PermitRootLogin yes /' /etc/ssh/sshd_config  \
			&& echo " StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
			&& echo " UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config \
			&& echo "root:root" | chpasswd 
RUN mkdir /var/run/sshd

# 设置之后ssh也可以使用java变量
ENV JAVA_HOME /usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH
ENV LC_ALL C.UTF-8
COPY --from=installer ["/usr/local/jdk1.8", "/usr/local/jdk1.8"]

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]