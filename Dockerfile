FROM ruby:2.5.0
RUN mkdir /app
# rails consoleで日本語を使えるようにする。
# https://gist.github.com/tasiyo7333/2163a09129ed36639645145a0146d8d3
ENV LANG C.UTF-8
RUN apt-get update -qq
# -y 処理中に現れるプロンプトは全てyesと答える
RUN apt-get install -y vim
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update && apt-get install -y nodejs yarn --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4
COPY . /app
