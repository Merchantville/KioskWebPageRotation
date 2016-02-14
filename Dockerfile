FROM debian:jessie

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    rm -rf google-chrome-stable_current_amd64.deb

ENTRYPOINT [ "google-chrome-stable" ]
