OpenOffice
===========

Unofficial build of OpenOffice 4.1.1 running within a docker container and rendered by the local X Server.

Changelog
---------
```
v1.1
* FirstRunWizard can be skipped by passing in additional configuration files (see example below).
I have included the registrymodifications.xcu in my [GitHub](https://github.com/chrisdaish/docker-openoffice/tree/master/configFiles).

v1.0
* User permissions now correlate between host and container. This allows OpenOffice documents to be saved back to the host system by passing in the local users uid/gid as environment variables.
```

Launch Command
---------------
```
docker run -v $HOME/Documents:/home/openoffice/Documents:rw -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name openoffice -i -t chrisdaish/openoffice
```
Additional config example:
```
docker run -v $HOME/Documents:/home/openoffice/Documents:rw -v $HOME/<pathToConfigFiles>/registrymodifications.xcu:/home/openoffice/.openoffice/5/user/registrymodifications.xcu:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name openoffice -i -t chrisdaish/openoffice
```

FAQ
---
Note: If you receive the following Gtk error:
```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session
```
xhost +local:docker
```
