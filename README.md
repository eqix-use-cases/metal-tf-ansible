# metal-tf-ansible
This repository shows how to deploy Equinix Metal using Terraform as provisioning and Ansible as configuration management.

## Table of Contents
- [Pre-requirement](#pre-requirements)
- [Usage](#usage)

## Pre-requirement

↥ [back to top](#table-of-contents)

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Terraform](https://terraform.io)
- [Equinix Metal Account](https://console.equinix.com/)

## Usage

↥ [back to top](#table-of-contents)

deploy local virtual machine

```bash
vagrant up --provider virtualbox
vagrant ssh
cd /vagrant #change the directory to working one, with terraform code
```

authentication - you have to have 3 variables to be able to provision infrastructure, [reference documentation](https://registry.terraform.io/providers/equinix/equinix/latest/docs)

```bash
echo "export METAL_AUTH_TOKEN=" | tee -a ~/.profile
echo "export EQUINIX_API_CLIENTID=" | tee -a ~/.profile
echo "export EQUINIX_API_CLIENTSECRET=" | tee -a ~/.profile
```

run terraform to create the infrastructure

```bash
terraform init
terraform apply
```

as result we'll get a machine on Equinix with nginx provisioned using ansible playbook

```yaml
---
- hosts: all
  become: yes
  gather_facts: yes
  tasks:
  - name: ensure nginx is at the latest version
    apt: name=nginx state=latest
  - name: start nginx
    service:
        name: nginx
        state: started
  - name: install curl
    apt: name=curl
```

destroy infrastructure

```bash
terraform destroy
```