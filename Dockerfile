FROM garo/easy-xpra:alpine
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apk add --no-cache --update py3-cairo
RUN apk add --no-cache --update firefox-esr
RUN apk add --no-cache --update ttf-dejavu

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
