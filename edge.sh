#!/bin/bash
APP="couchpotato"
REPO="https://github.com/RuudBurger/CouchPotatoServer.git"
INSTALLDIR="/opt/${APP}"

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
elif [[ -f /tmp/edge_installed ]]; then
  echo "Updating source..."
  cd /opt/${APP}
  git pull
else
  apt-get install -qy git >/dev/null
  echo "Downloading source..."
  tmpdir="/tmp/tmp.$(( $RANDOM * $RANDOM * $RANDOM * $RANDOM ))"
  git clone ${REPO} $tmpdir
  if [[ $? -eq 0 ]]; then
    rm -rf /opt/${APP}
    mv $tmpdir /opt/${APP}
    touch /tmp/edge_installed
  else
    rm -rf $tmpdir
  fi
fi

# Fix permissions
chown -R nobody:users /opt/${APP}
