FROM ruby:3.2.0-preview2

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt install -y nodejs

WORKDIR /src
CMD npm i && \
  bundle && \
  (cd src && bundle) && \
  bundle exec rake bormashino:download && \
  npm run build
