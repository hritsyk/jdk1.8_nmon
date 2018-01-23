FROM centos:latest

MAINTAINER Igor Grytsyk "gritsyk@gmail.com"

ENV	HOME /root
ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8
ENV JAVA_HOME /usr/java/jdk1.8.0_162
ENV CAPTURING_INTERVAL=1
ENV CAPTURING_COUNT=300
ENV JAVA_OPTS "-Xms1024M -Xmx2048M"
ENV SCHEDULED_TASK_INTERVAL 60
ENV LOG_DIR /logs
ENV NMON_START 0


RUN yum upgrade -y; \
    yum install -y wget; \
    yum install -y epel-release && \
    yum install -y nmon && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.rpm && \
    rpm -i jdk-8u162-linux-x64.rpm && \
    rm -f jdk-8u162-linux-x64.rpm  && \
    mkdir /scheduled-tasks && \
    mkdir /logs && \
    yum clean all

RUN yum remove wget;  yum clean all

ADD entrypoint.sh /
ADD scheduled-task-runner.sh /


ENTRYPOINT ["/entrypoint.sh"]