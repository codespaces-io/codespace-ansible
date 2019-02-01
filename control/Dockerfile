FROM codespaces/theia:v0.2.0

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get update && \
    apt-get install -y ansible openssh-server


COPY insecure_key.pem /root/.ssh/id_rsa



