FROM phusion/baseimage

ENV HOME /root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
# RUN apt-get upgrade -y

# Install additional packages
RUN apt-get install -y less curl man make host git wget python
#RUN apt-get install -y less curl man unixodbc libssl1.0.0 libwxgtk2.8-0 make host git wget python
RUN apt-get install -y --reinstall openssh-server

# create host keys
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
EXPOSE 22

# enable root access
RUN ssh-keygen -q -t rsa -f /root/.ssh/id_rsa -N ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN echo "root:root" | chpasswd

# initialize container after starting
ADD ./init-container /init-container
ADD ./create-user /create-user
ENTRYPOINT ["/init-container"]

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
