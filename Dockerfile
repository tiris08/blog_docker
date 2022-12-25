FROM ruby:2.7.5-alpine

RUN apk add --update --virtual \
  runtime-deps \
  build-base \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  libffi-dev \
  readline \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  tzdata \
  git \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["server", "-b", "0.0.0.0"]

EXPOSE 3000