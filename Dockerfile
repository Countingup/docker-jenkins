FROM jenkins/jenkins:lts-alpine

# Install plugins, if they aren't already
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Suppress plugin install banner
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

# Add docker tools, need to be root to do so
USER root

# We need a more recent docker, jenkins:lts-alpine is currently pegged to Alpine 3.5, so pull docker from 3.6
RUN echo "@v3.6 http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories

RUN apk add --update docker@v3.6 python py-pip \
    && pip install docker-compose \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

# Stay as root for custom entrypoint, which will then switch back to jenkins user
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]
