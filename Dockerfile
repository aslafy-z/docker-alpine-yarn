FROM mhart/alpine-node:base-7

RUN \
  # install yarn from edge
  mv /etc/apk/repositories /etc/apk/repositories.back && \
  echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories && \
  apk add --update --no-cache yarn && \
  mv /etc/apk/repositories.back /etc/apk/repositories && \
  yarn config set cache-folder /tmp/yarn && \
  # allow node to bind port 80
  apk add --no-cache --virtual .cap-deps libcap && \
  setcap cap_net_bind_service=ep /usr/bin/node && \
  apk del .cap-deps

CMD yarn
