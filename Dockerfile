FROM jenkins/jenkins:lts-alpine

# Install docker package for tools, needs to be done as root
USER root
RUN apk add --update docker && rm -rf /var/cache/apk/*

USER jenkins

# Install plugins, if they aren't already
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Suppress plugin install banner
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
