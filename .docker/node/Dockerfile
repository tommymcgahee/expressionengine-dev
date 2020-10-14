ARG CUSTOM_NODE_VERSION
FROM node:$CUSTOM_NODE_VERSION

RUN apk update; \
    apk upgrade; \
    # In alpine images users must be recreated in order to change their UID/GID
    # https://github.com/nodejs/docker-node/commit/c3694d8baa8a95472c007af5cadbb0068b81618e
    deluser --remove-home node \
    && addgroup -S node -g 1001 \
    && addgroup -S docker -g 1000 \
    && adduser -S -G docker -u 1000 node \
    && addgroup node node

USER node
WORKDIR /home/node

COPY ./package*.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "serve"]