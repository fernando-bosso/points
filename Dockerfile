FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

RUN bundle install --jobs 10 --retry 5
COPY . /usr/src/app
