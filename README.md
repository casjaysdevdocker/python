## 👋 Welcome to python 🚀  

Description  
  
  
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
mkdir -p "$HOME/.local/share/srv/docker/python/rootfs"
git clone "https://github.com/dockermgr/python" "$HOME/.local/share/CasjaysDev/dockermgr/python"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/python/rootfs/." "$HOME/.local/share/srv/docker/python/rootfs/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-python \
--hostname python \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-python/rootfs/data:/data:z" \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-python/rootfs/config:/config:z" \
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
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-python/rootfs/data:/data:z"
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-python/rootfs/config:/config:z"
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
