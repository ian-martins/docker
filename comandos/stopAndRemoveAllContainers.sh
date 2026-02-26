containers=$(docker ps -aq)
if  [ -n "$containers" ]; then
    docker stop $(docker ps -q)
    docker rm $(docker ps -aq)
fi


