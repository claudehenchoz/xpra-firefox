FROM garo/easy-xpra:latest
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

#Install firefox, everything is on 1 layer to shrink image size (e.g. cleaning the apt cache on a new layer is pretty useless because the layer before still contains this data)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install firefox && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Run firefox in xpra
CMD ["run_in_xpra", "firefox"]
