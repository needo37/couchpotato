This is a Dockerfile setup for couchpotato - https://couchpota.to/

By default this Docker installs the latest stable version of CouchPotato:

```
docker run -d --net="host" --name="couchpotato" -v /path/to/couchpotato/data:/config -v /path/to/downloads:/downloads -v /path/to/movies:/movies -v /etc/localtime:/etc/localtime:ro needo/couchpotato
```

Edge
----
If you would like to run the latest updates from the master branch as well as enable in-app updates run:

```
docker run -d --net="host" --name="couchpotato" -v /path/to/couchpotato/data:/config -v /path/to/downloads:/downloads -v /path/to/movies:/movies -v /etc/localtime:/etc/localtime:ro -e EDGE=1 needo/couchpotato
```