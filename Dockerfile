FROM garo/easy-xpra:latest
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apt-get update && apt-get -y install curl libgtk-3-0 libdbus-glib-1-2 && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root

ARG VERSION=74.0b5

RUN curl https://download-installer.cdn.mozilla.net/pub/devedition/releases/${VERSION}/linux-x86_64/en-US/firefox-${VERSION}.tar.bz2 | tar -jxv
WORKDIR /root/firefox
#Run firefox in xpra
CMD ["run_in_xpra", "/root/firefox/firefox-bin"]
