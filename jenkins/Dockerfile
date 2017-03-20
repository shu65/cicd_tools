FROM jenkins:latest

# install via apt
USER root

RUN apt-get update && \
  apt-get install -y \
    git \
    sudo \
    curl \
    sudo && \
  rm -rf /var/lib/apt/lists/*

# install jenkins plugins
RUN /usr/local/bin/install-plugins.sh git:latest \
  jobConfigHistory:latest \
  junit:latest 

# start jenkins
CMD DOCKER_GID=$(stat -c '%g' /var/run/docker.sock) && \
    groupadd -for -g ${DOCKER_GID} docker && \
    usermod -aG docker jenkins && \
    sudo -E -H -u jenkins bash -c /usr/local/bin/jenkins.sh
