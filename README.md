This is a Dockerfile setup for couchpotato - https://couchpota.to/

To run:

docker run -d --net="host" --name="couchpotato" -v /path/to/couchpotato/data:/config -v /path/to/downloads:/downloads -v /path/to/movies:/movies -v /etc/localtime:/etc/localtime:ro -p 5050:5050 needo/couchpotato
