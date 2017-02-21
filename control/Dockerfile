FROM codespaces/base-ubuntu-akurath:v0.1.0
MAINTAINER Vijayboopathy E <vibe@initcron.org>

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get update && \
    apt-get install -y ansible

EXPOSE 22 8000

CMD /usr/bin/akurath run 

