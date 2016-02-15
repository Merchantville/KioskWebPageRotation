FROM ubuntu:14.04

RUN apt-get -y install software-properties-common && apt-add-repository multiverse

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true | debconf-set-selections

RUN apt-get update && \
    apt-get -y install firefox flashplugin-installer dbus-x11 pulseaudio gstreamer1.0-pulseaudio \
                       gstreamer1.0-plugins-good ubuntu-restricted-extras

RUN apt-get install -y xdotool

ENTRYPOINT ["/usr/bin/firefox"]
