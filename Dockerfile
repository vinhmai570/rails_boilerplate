FROM ruby:3.1.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    curl \
    build-essential \
    libpq-dev \
    postgresql-client \
    git \
    imagemagick \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends yarn

WORKDIR /var/www/html

COPY scripts/start.sh /usr/bin/

COPY Gemfile* ./

COPY package.json ./

COPY yarn.lock ./

USER root
RUN chmod +x /usr/bin/start.sh

EXPOSE 3000
