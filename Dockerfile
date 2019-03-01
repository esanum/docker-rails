FROM ruby:2.5-alpine

# We do this because rmagick doesn't support imagemagick 7
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories

RUN apk --update --no-cache add \
  sqlite-dev \
  alpine-sdk \
  mariadb-dev \
  libxml2-dev \
  nodejs \
  fontconfig \
  librsvg \
  curl-dev \
  librsvg \
  readline-dev \
  mysql-client \
  # We do this because rmagick doesn't support imagemagick 7
  imagemagick=6.9.6.8-r1 \
  imagemagick-dev=6.9.6.8-r1 \
  tzdata \
  openssh-client

# Install phantomjs for alpine
RUN apk --no-cache add npm
RUN wget -qO- "https://github.com/dustinblackman/phantomized/releases/download/2.1.1a/dockerized-phantomjs.tar.gz" | tar xz -C /
RUN npm config set user 0 && npm install -g phantomjs-prebuilt && \
      apk del npm
