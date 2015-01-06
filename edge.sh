#!/bin/bash
APP="couchpotato"
REPO="https://github.com/RuudBurger/CouchPotatoServer.git"
INSTALLDIR="/opt/${APP}"

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested."
elif [[ -f /var/lib/edge_installed ]]; then
  echo "Updating source..."
  mkdir -p ${INSTALLDIR} && cd ${INSTALLDIR}
  git pull
else
  echo "Downloading source..."
  tmpdir="/tmp/tmp.$(( $RANDOM * $RANDOM * $RANDOM * $RANDOM ))"
  git clone --depth=1 ${REPO} ${tmpdir}
  if [[ $? -eq 0 ]]; then
    rm -rf ${INSTALLDIR}
    mv ${tmpdir} ${INSTALLDIR}
    touch /var/lib/edge_installed
  else
    rm -rf ${tmpdir}
  fi
fi

# Fix permissions
chown -R nobody:users ${INSTALLDIR}