FROM centos:7

RUN yum -y install \
        openssh-server \
        augeas \
        sudo \
    && \
    yum clean all

ENV USER_NAME=ansible \
    USER_UID=1000

# Create an admin user and add them to the list of sudoers
RUN adduser --create-home --uid ${USER_UID} --comment "Ansible User" ${USER_NAME} && \
    echo -e "${USER_NAME}\tALL=(ALL)\tNOPASSWD: ALL" > /etc/sudoers.d/${USER_NAME}

# Update SSH configuration to disable password and GSSAPI authentication
RUN augtool 'set /files/etc/ssh/sshd_config/PasswordAuthentication no' && \
    augtool 'set /files/etc/ssh/sshd_config/GSSAPIAuthentication no'

# Copy entry point script
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]