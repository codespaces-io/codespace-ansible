FROM ubuntu:14.04

MAINTAINER Babu R <babu@initcron.org>

WORKDIR /workspace

VOLUME /workspace

RUN apt-get update && \
	apt-get install -y make g++ python git curl && \
	curl -sL https://deb.nodesource.com/setup | sudo bash - && \
	apt-get install -y nodejs && \
	npm -g install node-gyp akurath && \
	cd /usr/lib/node_modules/akurath/node_modules/shux/node_modules/pty.js && \
	make clean && \
	make

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get update && \
    apt-get install -y ansible

RUN apt-get install -y openssh-server sudo vim

RUN mkdir /var/run/sshd

COPY motd.sh /opt/

RUN chmod +x /opt/motd.sh && \
    sh /opt/motd.sh && \
    rm -rf motd.sh

RUN useradd -ms /bin/bash devops && \
    echo 'devops:codespaces' |chpasswd && \
    adduser devops sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers  && \
    echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config

COPY insecure_key.pem /root/.ssh/id_rsa

EXPOSE 22 8000

CMD /usr/bin/akurath run
