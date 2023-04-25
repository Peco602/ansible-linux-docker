![Test](https://github.com/Peco602/ansible-linux-docker/actions/workflows/test.yml/badge.svg)
![Push](https://github.com/Peco602/ansible-linux-docker/actions/workflows/push.yml/badge.svg)

# Ansible Linux Docker image

Run Ansible in a Linux container.

## Build the image

```ps1
docker build -t ansible-linux-docker:latest .
```

## Run the container

Mount the `ansible` folder containing:
- `ansible.cfg`: Ansible default configuration
- `hosts`: Hosts inventory
- `playbook.yml`: Ansible playbook
and execute the `ansible-playbook` command:
```ps1
docker run --rm -v $PWD/ansible:/etc/ansible ansible-linux-docker:latest ansible-playbook /etc/ansible/playbook.yml -i /etc/ansible/hosts
```

Mount the `ansible` folder and run the container interactively:
```ps1
docker run --rm -v $PWD/ansible:/etc/ansible -ti ansible-linux-docker:latest bash
```

## DockerHub

- [peco602/ansible-linux-docker](https://hub.docker.com/r/peco602/ansible-linux-docker)
