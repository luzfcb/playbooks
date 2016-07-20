Playbooks
=========

[![Build Status](https://travis-ci.org/luzfcb/playbooks.svg)](https://travis-ci.org/luzfcb/playbooks)

The ansible playbooks to deploy my machine (only on Ubuntu)

Automatic install (only on Ubuntu)
----------------------------------


Faça o fork do repositorio e modifique o arquivo [`workstation.yml`](https://github.com/luzfcb/playbooks/blob/master/workstation.yml) e [`deploy_my_machine.sh`](https://github.com/luzfcb/playbooks/blob/master/deploy_my_machine.sh#L12-L13) e insira as suas configurações pessoais.


```
wget -O /tmp/deploy_my_machine.sh https://raw.githubusercontent.com/NOME_DO_SEU_USUARIO_DO_GITHUB/playbooks/master/deploy_my_machine.sh && . /tmp/deploy_my_machine.sh
```


Manual install
--------------

Install Ansible

```bash
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
sudo -H python2 /tmp/get-pip.py -U
sudo -H pip install ansible
```

Run

```bash
ansible-playbook workstation.yml --ask-sudo-pass
```

Para mim:

```
wget -O /tmp/deploy_my_machine.sh https://raw.githubusercontent.com/luzfcb/playbooks/master/deploy_my_machine.sh && . /tmp/deploy_my_machine.sh
```

> This repo is based on https://github.com/drgarcia1986/playbooks and https://github.com/renanivo/playbooks
