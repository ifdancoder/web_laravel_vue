FROM node:latest

ARG USERNAME

ARG UID
ARG GID

RUN groupmod -g $GID node || groupadd -g $GID node
RUN usermod -u $UID node || useradd -u $UID node

USER node

EXPOSE 8080