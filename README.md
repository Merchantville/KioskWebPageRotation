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

## Storage Clean Up

# Starting the Kiosk

### TODO: Add these to Puppet/Consul/Bash
    apt-get install -y lxde-core
    update-alternatives --config x-session-manager (choose startlxde)
    xhost +local:
    startx

