# Script to serve static site dir using nginx in docker.

CONTAINER=docker-nginx
PORT=8080
STATIC_DIR="$HOME/docker-nginx/html"

docker stop $CONTAINER
docker rm $CONTAINER
docker run --name $CONTAINER -p $PORT:80 -v $STATIC_DIR:/usr/share/nginx/html -d nginx
