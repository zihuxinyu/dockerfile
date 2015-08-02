FROM jenkins:

USER root

RUN bash -c "if ! [ -e /usr/lib/apt/methods/https ]; then apt-get update && apt-get install -y apt-transport-https; fi"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 \
 && sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list" \
 && apt-get update && apt-get install -y lxc-docker \
 && apt-get install -y sudo \
 && rm /etc/apt/sources.list.d/docker.list \
 && rm -rf /var/lib/apt/lists/*

ADD docker-1.6.2 /usr/bin/docker
RUN chmod +x /usr/bin/docker

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
