#!/bin/bash

docker login -u peco602
docker tag ansible-linux-docker:latest peco602/ansible-linux-docker:latest
docker push peco602/ansible-linux-docker:latest