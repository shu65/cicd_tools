FROM jenkins:latest

# install via apt
USER root

RUN apt-get update && \
  apt-get install -y \
    curl \
    sudo \
    gcc \
    g++ \
    libgtest-dev \
    libboost-all-dev \
    cmake \
    make && \
  rm -rf /var/lib/apt/lists/*

# install gtest
RUN cd /usr/src/gtest && cmake . && cmake --build . && mv libg* /usr/local/lib/

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# start jenkins
CMD DOCKER_GID=$(stat -c '%g' /var/run/docker.sock) && \
    groupadd -for -g ${DOCKER_GID} docker && \
    usermod -aG docker jenkins && \
    sudo -E -H -u jenkins bash -c /usr/local/bin/jenkins.sh
