FROM jenkins:2.32.2

# install via apt
USER root

RUN apt-get update
RUN apt-get install -y \
  gcc \
  g++ \
  libgtest-dev \
  cmake \
  make 

# install gtest
RUN cd /usr/src/gtest && cmake . && cmake --build . && mv libg* /usr/local/lib/

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# drop back to the regular jenkins user - good practice
USER jenkins