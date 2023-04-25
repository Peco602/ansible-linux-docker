![Test](https://github.com/Peco602/ansible-linux-docker/actions/workflows/test.yml/badge.svg)
![Push](https://github.com/Peco602/ansible-linux-docker/actions/workflows/push.yml/badge.svg)

# Ansible Linux Docker image

This Docker image allows to run Ansible from a Linux container. It supports Linux, Windows and MacOS target hosts.


## Build the image

```bash
docker build -t ansible-linux-docker:latest .
```

## Run the container

Mount the `ansible` folder containing:

- `ansible.cfg`: Ansible default configuration
- `hosts`: Hosts inventory
- `playbook.yml`: Ansible playbook

and execute the `ansible-playbook` command:

```bash
docker run --rm -v $PWD/ansible:/etc/ansible ansible-linux-docker:latest ansible-playbook /etc/ansible/playbook.yml -i /etc/ansible/hosts
```

Mount the `ansible` folder and run the container interactively:

```bash
docker run --rm -v $PWD/ansible:/etc/ansible -ti ansible-linux-docker:latest bash
```

## DockerHub

- [peco602/ansible-linux-docker](https://hub.docker.com/r/peco602/ansible-linux-docker)


## Authors

- [Giovanni Pecoraro](https://www.peco602.com/)
