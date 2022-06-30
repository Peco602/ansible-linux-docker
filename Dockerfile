FROM ubuntu:20.04

LABEL name="Ansible Linux Container"
LABEL description="This container is a Linux container designed to run Ansible."
LABEL maintainer="Peco602 <giovanni1.pecoraro@protonmail.com>"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg2 python3-pip python-dev sshpass git openssh-client libkrb5-dev krb5-user nano && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN DEBIAN_FRONTEND=noninteractive python3 -m pip install --upgrade pip cffi && \
    pip install ansible-core ansible && \
    pip install mitogen ansible-lint jmespath && \
    pip install "pywinrm>=0.3.0" && \
    pip install pywinrm[kerberos] && \
    pip install pykerberos && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]