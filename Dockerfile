FROM alpine:3.10	

LABEL maintainer="freedox"

RUN 	echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/community/" >> /etc/apk/repositories && \
	apk update && \
	apk upgrade && \
	apk add curl bash && \
	adduser noip-user -D -h /home/noip/ -s /bin/sh -u 2000
		
COPY	--chown=noip-user:noip-user noip-update.sh /home/noip/noip-update.sh

RUN	chmod u+x /home/noip/noip-update.sh

ENV	NOIP_INTERVAL=5

USER	noip-user

ENTRYPOINT	/bin/bash /home/noip/noip-update.sh
