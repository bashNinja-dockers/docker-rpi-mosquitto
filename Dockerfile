#FROM lsiobase/alpine.armhf:edge
FROM lsiobase/alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Mike Weaver"


RUN apk --no-cache add mosquitto mosquitto-clients

RUN \
  echo "**** install build packages ****" && \
 apk add --no-cache \
	mosquitto \
	mosquitto-clients && \
 echo "**** cleanup ****" && \
 rm -rf \
	/root/.cache

# add local files
COPY root/ /

# Exposes Port 1883 (MQTT) 9001 (Websocket MQTT)
EXPOSE 1883 9001
VOLUME /config
