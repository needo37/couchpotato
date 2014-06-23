FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# Install plexWatch Dependencies
RUN apt-get install -qy git python

# Checkout CouchPotato from github
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato
RUN chown -R nobody:users /opt/couchpotato

EXPOSE 5050

# Couchpotato Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# Movies directory
VOLUME /movies

# Because running things as root is wrong
USER nobody
ENTRYPOINT ["python", "/opt/couchpotato/CouchPotato.py"]
CMD ["--config_file=/config/config.ini", "--data_dir=/config/data"]
