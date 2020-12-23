NAME=nginx-ms
# docker stop $NAME
# docker rm $NAME
docker run --name $NAME -p 5000:5000 -v $(pwd)/conf:/etc/nginx -v $(pwd)/certs:/etc/ssl/private nginx
