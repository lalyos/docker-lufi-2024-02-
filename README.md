
## Docker training

Notes: https://lalyos.notion.site/Lufthansa-docker-2023-02-21-8865d5e816f64f828e558314c2349b32?pvs=25

https://github.com/lalyos/docker-lufi-2024-02-


```
docker version

```

## First Container

```
docker run -it  ubuntu

apt-get update -qq
apt-get install -y curl
apt-get install -y html2text
exit
```

```
docker ps
docker ps -a
docker ps -n 3

docker ps -n 1
docker ps -l

docker rename 2ea ubul
docker start ubul
docker attach ubul
```

```
docker run -it --name second ubuntu
exit
docker rm second
```

```
docker commit ubul kurl
docker images
docker history kurl
```


```
docker run ubuntu echo hello
docker run -d ubuntu echo coffe break
docker logs f7

docker run --name loop  -d ubuntu bash -c 'while true; do sleep 1; date; done'
docker logs --tail 0 -f  loop
 docker exec -it loop bash

```


## Webserver

```
docker run -it kurl

apt-get install -y nginx
nginx # starts in background
ps -ef
echo lunchtime > /var/www/html/index.html
# find / -name \*.html
curl localhost
exit

docker commit 8cc lunch
```

```
alias nuke='docker rm -f $(docker ps -qa)'
```

```
docker run -d  lunch nginx -g 'daemon off;'

docker exec $(docker ps -lq) curl -s localhost
```

## Dockerfile

```
docker build -t lunch:v1 .
docker run -d  lunch:v1 nginx -g 'daemon off;'
docker exec $(docker ps -lq) curl -s localhost
```

```
docker run -d  lunch:v2
```


## Publish Images

```
docker build -t lalyos/lunch:v6
# register a user at hub.docker.com
docker login
docker push lalyos/lunch:v6
```

Image cannonical name:
ubuntu = docker.io/library/ubuntu:latest
- docker.io : registry server dns
- library: owner/repo
- ubuntu: image name
- latest: tag/version


```
docker build -t ttl.sh/lalyos/lunch:v6 
docker push ttl.sh/lalyos/lunch:v6 
```

```
docker run -dP \
  -e COLOR=hotpink \
  -e TITLE="coffee time for lalyos [XX2]" \
  -e BODY='todo ...' \
  lalyos/lunch:v6
```




## Networking

```
docker network ls

docker network create lufi
docker run -dP \
  --name back \
  -e TITLE=backend \
  --net lufi  \
  lunch:v6


docker run -it \
  --net lufi 
  tool
```

## Volumes

```
docker volume ls
```

### Postgres
```
docker run -d \
  --name mydb \
  -e POSTGRES_PASSWORD=secret \
  postgres
```

```
alias vip="docker exec -it mydb psql -U postgres -c 'select * from vip;'"
```


```
docker run -d \
  -v 768705ead2981c361d83d62057891ceabce6f7d945a7be71abc9aebd32d57d51:/var/lib/postgresql/data \
  --name mydb \
  -e POSTGRES_PASSWORD=secret \
  postgres
```