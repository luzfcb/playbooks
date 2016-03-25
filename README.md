Playbooks
=========

[![Build Status](https://travis-ci.org/drgarcia1986/playbooks.svg)](https://travis-ci.org/drgarcia1986/playbooks)

The ansible playbooks to deploy my machine (only on Ubuntu)

Automatic install (only on Ubuntu)
----------------------------------

```
# ainda nao funciona, preciso descobrir porque nao esta travando na hora de digitar a senha
wget -O - https://raw.githubusercontent.com/luzfcb/playbooks/master/deploy_my_machine.sh | bash
```

Manual install
--------------

Install Ansible

```bash
sudo add-apt-repository ppa:ansible/ansible --yes
sudo apt-get update
sudo apt-get install ansible
```

Run

```bash
ansible-playbook workstation.yml --ask-sudo-pass
```

> This repo is based on https://github.com/drgarcia1986/playbooks and https://github.com/renanivo/playbooks
