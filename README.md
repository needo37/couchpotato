This is a Dockerfile setup for couchpotato - https://couchpota.to/

To run:

docker run -d --name="couchpotato" -v /path/to/couchpotato/data:/config -v /path/to/downloads:/downloads -v /path/to/movies:/movies -p 5050:5050 needo/couchpotato
