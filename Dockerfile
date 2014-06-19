FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q

# Install plexWatch Dependencies
RUN apt-get install -qy git python

# Checkout CouchPotato from github
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato

EXPOSE 5050

# Couchpotato Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# Movies directory
VOLUME /movies

ENTRYPOINT ["python", "/opt/couchpotato/CouchPotato.py", "--data_dir=/config"]
