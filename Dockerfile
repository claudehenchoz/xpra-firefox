FROM garo/easy-xpra:latest
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apt-get update && apt-get -y install firefox && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root
RUN mkdir -p .mozilla/firefox/abcdefgh.default
RUN echo 'user_pref("browser.tabs.remote.autostart", false);' > .mozilla/firefox/abcdefgh.default/user.js
RUN echo '[General]\n\
StartWithLastProfile=1\n\
\n\
[Profile0]\n\
Name=Default User\n\
IsRelative=1\n\
Path=abcdefgh.default\n\
' > .mozilla/firefox/profiles.ini

COPY generatemachineid.py .
RUN ./generatemachineid.py > /etc/machine-id && rm generatemachineid.py

#Run firefox in xpra
CMD ["run_in_xpra", "firefox"]
