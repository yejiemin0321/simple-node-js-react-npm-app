FROM jenkins/jenkins:lts-jdk17
USER root
CMD ["sh", "-c", "date"]
RUN apt-get update && apt-get install -y lsb-release
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates
RUN curl --insecure /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y -o Acquire::https::Verify-Peer=false -o Acquire::https::Verify-Host=false docker-ce-cli
USER jenkins
RUN curl -k -L https://github.com/jenkinsci/docker-workflow-plugin/releases/download/572.v950f58993843/docker-workflow.hpi -o docker-workflow.hpi