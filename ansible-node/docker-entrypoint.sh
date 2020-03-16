#!/usr/bin/env bash

# Generate host keys
ssh-keygen -A

# Generate SSH keys for the admin user (using 'yes' to accept all defaults)
su -c 'yes "" | ssh-keygen -N ""' ${USER_NAME}

# Add the public key to the authorized_keys file to allow login on all machines
su -c 'cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys' ${USER_NAME}

# Execute the command specified by CMD
exec "$@"