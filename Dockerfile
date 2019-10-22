FROM alpine:3.10

LABEL MAINTAINER "Hadrien Mary <hadrien.mary@gmail.com>"

ENV S6_VERSION "v1.22.1.0"
ENV S6_ARCH "amd64"

RUN apk add --no-cache --update sudo bash rsync tzdata curl coreutils shadow \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

RUN curl -L -s https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}.tar.gz | tar xvzf - -C /

COPY rootfs /

RUN mkdir /data \
	&& useradd -u 911 -U -s /bin/false abc 

ENV RSYNC_CRONTAB "0 0 * * *"
ENV RSYNC_OPTIONS "--archive --timeout=3600 --verbose --progress"

VOLUME /data/source
VOLUME /data/destination

ENTRYPOINT [ "/init" ]
