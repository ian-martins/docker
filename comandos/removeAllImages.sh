source comandos/stopAndRemoveAllContainers.sh
docker rmi $(docker images -q)