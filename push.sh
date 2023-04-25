#!/bin/bash

echo " [+] Logging into Docker Hub"
docker login -u peco602

echo " [+] Tagging image"
docker tag ansible-linux-docker:latest peco602/ansible-linux-docker:latest

echo " [+] Pushing to Docker Hub"
docker push peco602/ansible-linux-docker:latest
