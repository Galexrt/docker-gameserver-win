FROM fedora:25
LABEL maintainer="Alexander Trost <galexrt@googlemail.com>"

ENV DATA_PATH="/data"

RUN dnf -q upgrade -y && \
    dnf install -y curl ca-certificates glibc.i686 libstdc++.i686 python \
        curl wine xorg-x11-server-Xvfb && \
    dnf clean all && \
    rm -rf /var/lib/dnf/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/*

COPY entrypoint.sh /entrypoint.sh

VOLUME ["$DATA_PATH"]
WORKDIR "$DATA_PATH"

ENTRYPOINT ["/entrypoint.sh"]
