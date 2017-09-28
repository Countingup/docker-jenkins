# jenkins

[![Docker Automated buil](https://img.shields.io/docker/build/countingup/jenkins.svg)](https://hub.docker.com/r/countingup/jenkins/builds/)

Jenkins with the Docker tools, blueocean and other useful plugins, installed by default. Built on top of jenkins:alpine-lts.

Full plugin list is in plugins.txt

## Build locally

```
$ cd docker-jenkins
$ docker build -t jenkins .
```

## Run (will pull from dockerhub)

```
$ docker run -it -p 8080:8080 countingup/jenkins
```
