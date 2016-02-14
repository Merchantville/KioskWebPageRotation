FROM debian:jessie

RUN apt-get update && apt-get install -y wget && apt-get --purge -y autoremove

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    apt-get --purge -y autoremove

ENTRYPOINT [ "google-chrome-stable" ]
