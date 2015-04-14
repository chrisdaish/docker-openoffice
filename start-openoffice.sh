#!/bin/bash
groupmod -g $gid openoffice
usermod -u $uid -g $gid openoffice

if [ -d /home/openoffice/.openoffice ]; then
  chown -R openoffice:openoffice /home/openoffice/.openoffice
fi

exec su -ls "/bin/bash" -c "mkdir -p /home/openoffice/.local/share; /usr/bin/soffice $ARGS $FILE" openoffice
