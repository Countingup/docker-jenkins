# jenkins

[![Docker Automated buil](https://img.shields.io/docker/build/countingup/jenkins.svg)](https://hub.docker.com/r/countingup/jenkins/builds/)

> WARNING
>
> If you run this container with the host's docker socket bind mounted then you are granting Jenkins, everyone with access to Jenkins, and all code executed under Jenkins, root access to that host (since any of these could start a container with such access).
>
> Consider carefully where you run this and what other mitigating controls you put in place, certainly, this has no place in a production environment. If you don't understand this warning you shouldn't run this image!

Jenkins with the Docker tools, blueocean and other useful plugins, rancher CLI, all installed by default.

Built on top of jenkins:alpine-lts. Full plugin list is in plugins.txt

## Build locally

```
$ cd docker-jenkins
$ docker build -t countingup/jenkins .
```

## Run (will pull from dockerhub)

```
$ docker run -it -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock countingup/jenkins
```
