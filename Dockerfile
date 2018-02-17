FROM ubuntu:16.04

WORKDIR /root

USER root

RUN apt-get update && apt-get install -y wget unzip openssh-server nano

RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

#CMD ["/usr/sbin/sshd","-D"]

