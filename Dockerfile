FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# Install plexWatch Dependencies
RUN apt-get install -qy python wget

# Install CouchPotato v2.4.0
RUN mkdir /opt/couchpotato
RUN wget -P /tmp/ https://github.com/RuudBurger/CouchPotatoServer/archive/build/2.4.0.tar.gz
RUN tar -C /opt/couchpotato -xvf /tmp/2.4.0.tar.gz --strip-components 1
RUN chown nobody:users /opt/couchpotato

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
