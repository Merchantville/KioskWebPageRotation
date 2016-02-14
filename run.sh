docker run -it --rm \
    --net host \
    --cpuset-cpus 0 \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY \
    --name chrome \
    chrome


    #-v $HOME/Downloads:/root/Downloads \
    #-v $HOME/.config/google-chrome/:/data \
