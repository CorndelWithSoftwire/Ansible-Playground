# Ansible Playground

This project creates a group of containers designed to represent a realistic application infrastructure, with an Ansible control node and a number of web and database servers that Ansible will manage. It uses Docker Compose to define a multi-container setup consisting of the following services:
* An `ansible` service with the Ansible CLI installed -- this acts as the control node for the virtual infrastructure.
* Three `web` services with vanilla Linux OS installations (CentOS) -- to be provisioned by Ansible as web servers.
* A `db` service, again with the same vanilla Linux OS installed -- to be set up as a database server.

The `web` and `db` containers are created from an official CentOS Linux image that has been modified to run an SSH server on startup, with a non-root admin user set up with SSH access from the `ansible` service. SSH keys are shared between containers using a named volume.

## Getting Started

To build and create the service containers, run:
```bash
$ docker-compose up --detach
```
Then start an interactive shell session in the `ansible` container to execute Ansible commands:
```bash
$ docker-compose run ansible
```
From within that interactive session, verify that Ansible can connect to all the managed nodes by running:
```bash
$ ansible all -m ping
```
You should see a success message including `"ping": "pong"` returned for each machine (`web1`, `web2`, `web3` and `db1`).
