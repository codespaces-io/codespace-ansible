FROM centos:8

LABEL env=des

RUN yum -y install openssh-server shadow-utils sudo

COPY motd.sh /opt/

RUN chmod +x /opt/motd.sh && \
    sh /opt/motd.sh && \
    rm -rf /opt/motd.sh && \
    useradd devops && \
    echo 'devops:codespaces' | chpasswd

RUN echo 'devops ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    mkdir -p /home/devops/.ssh

ADD authorized_keys /home/devops/.ssh/authorized_keys

RUN chown -R devops. /home/devops/.ssh && \
    rm /run/nologin

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
