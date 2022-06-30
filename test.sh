#!/bin/bash

NETWORK_NAME="ansible_test_net"
TARGET_IMAGE_NAME="peco602/ssh-linux-docker:latest"
ANSIBLE_IMAGE_NAME="ansible-linux-docker:latest"

echo " [+] Building docker image"
docker build -t $ANSIBLE_IMAGE_NAME .

echo " [+] Running target containers"
docker network create $NETWORK_NAME --subnet="192.168.100.1/24"
for i in $(seq 2 3);
do
    docker run --network=$NETWORK_NAME --ip="192.168.100.$i" -d $TARGET_IMAGE_NAME
done

echo " [+] Collecting data"
docker run --rm --network=$NETWORK_NAME -v $PWD/ansible:/etc/ansible $ANSIBLE_IMAGE_NAME ansible-playbook /etc/ansible/playbook.yml -i /etc/ansible/hosts

echo " [+] Clean-up"
docker rm $(docker network inspect $NETWORK_NAME --format='{{range $id, $_ := .Containers}}{{println $id}}{{end}}') --force
docker network rm $NETWORK_NAME