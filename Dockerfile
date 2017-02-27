FROM mhart/alpine-node:base-7

ENV HOME="/root"

RUN apk add --update --no-cache --virtual .build-deps curl gnupg libcap && \
  curl -o- -L https://yarnpkg.com/install.sh | sh && \
  # allow node to bind port 80
  setcap cap_net_bind_service=ep /usr/bin/node && \
  apk del .build-deps

ENV PATH="$PATH:$HOME/.yarn/bin"

CMD yarn
