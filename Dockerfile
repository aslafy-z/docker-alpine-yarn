FROM node:7-alpine

RUN \
  yarn config set cache-folder /tmp/yarn && \
  # allow node to bind port 80
  apk add --no-cache --virtual .cap-deps libcap && \
  setcap cap_net_bind_service=ep /usr/local/bin/node && \
  apk del .cap-deps

CMD yarn
