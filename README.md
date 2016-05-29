# kiosk

Kisok to display web pages

# Hardware

## Intel Compute Stick Linux BOXSTCK1A8LFC

### Specs.

 - Ubuntu 14.04 LTS 64-bit
 - Intel Atom Z3735F 1.33Ghz
 - Level 2 Cache 2MB
 - 1024MB DDR3L-1333 SDRAM
 - 8GB Flash
 - TODO: add flash memory

## TODO: Script Storage Clean Up

### Get .5 GB

    Uninstall or remove - /usr/lib/{chromium-browser,libreoffice}
    Cleanup apt - /var/cache/apt/{archive,lists}
    Cleanup docker tmp - /var/lib/docker/tmp/*

# Starting the Kiosk

### TODO: Add these to Puppet/Consul/Bash
    apt-get install -y lxde-core
    update-alternatives --config x-session-manager (choose startlxde)
    xhost +local:
    startx
    export WIDTH=$(xrandr | grep \* | awk '{print $1}' | awk -Fx '{print $2}'
    export HEIGHT=$(xrandr | grep \* | awk '{print $1}' | awk -Fx '{print $1}'
    @xrandr --auto --output DVI-1 --primary --mode ${WIDTH}x${HEIGHT} --left-of DVI-0
