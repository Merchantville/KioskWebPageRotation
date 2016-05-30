FROM alpine:3.3

#RUN apk add --update x11vnc --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
#    apk add --update alpine-base sudo xvfb libx11 randrproto xineramaproto lxdm libc6-compat fluxbox firefox \
#    xf86-video-fbdev \
#    xf86-video-dummy xf86-input-synaptics xf86-input-evdev && \

ENV FIREFOX_VERSION="38.3.0" \
    FIREFOX_ADDONS_URL="https://addons.mozilla.org/firefox/downloads/latest" \
    EXT_UID="207605"

RUN export TTFS=$(apk search -q ttf- | grep -v '\-doc') && \
    export FONTS=$(apk search -q font- | grep -v '\-doc')

RUN apk add --update bash curl xvfb dbus-x11 firefox=${FIREFOX_VERSION}-r1 libcanberra-gtk2 ${TTFS} ${FONTS} && \
    rm -rf /var/cache/apk/*

WORKDIR /extensions

# Install tabrotating plugin
RUN curl -LO $FIREFOX_ADDONS_URL/$EXT_UID/addon-${EXT_UID}-latest.xpi && \
    unzip addon-${EXT_UID}-latest.xpi && \
    rm addon-${EXT_UID}-latest.xpi && \
    export EXT_ID=$(cat install.rdf | grep "<em:id>" | head -n 1 | sed 's/^.*>\(.*\)<.*$/\1/g') && \
    export EXT_DIR="/usr/lib/firefox-${FIREFOX_VERSION}/browser/extensions/${EXT_ID}" && \
    export EXT_PATH="Extension0=${EXT_DIR}^M" && \
    mkdir ${EXT_DIR} && mv * ${EXT_DIR}
    #sed -i "/ExtensionDirs/a $EXT_PATH" $(find ~/.mozilla/ -name extensions.ini) && \

# https://addons.mozilla.org/firefox/downloads/latest/207605/addon-2076050-latest.xpi

#RUN timeout -t 10 sh -c "Xvfb :10 -ac && \
#    export DISPLAY=:10 && \
#RUN /usr/bin/firefox -CreateProfile "Derp /root/mozilla" 

ENTRYPOINT ["/usr/bin/firefox"]

CMD ["-xpinstall.signatures.required=false"]
