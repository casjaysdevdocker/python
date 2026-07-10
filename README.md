## 👋 Welcome to python 🚀  

python README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update python
```
  
## Install and run container
  
```shell
dockerHome="/srv/$USER/docker/casjaysdevdocker/python/python/latest/rootfs"
mkdir -p "/srv/$USER/docker/python/rootfs"
git clone "https://github.com/dockermgr/python" "$HOME/.local/share/CasjaysDev/dockermgr/python"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/python/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-python-latest \
--hostname python \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/python:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/python
    container_name: casjaysdevdocker-python
    environment:
      - TZ=America/New_York
      - HOSTNAME=python
    volumes:
      - "/srv/$USER/docker/casjaysdevdocker/python/python/latest/rootfs/data:/data:z"
      - "/srv/$USER/docker/casjaysdevdocker/python/python/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/python
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/python" "$HOME/Projects/github/casjaysdevdocker/python"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/python"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
