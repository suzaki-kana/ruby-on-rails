FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

RUN mkdir /myHome
RUN mkdir /myHome/docker
WORKDIR /myHome/docker

COPY ./docker/Gemfile /myHome/docker/Gemfile
COPY ./docker/Gemfile.lock /myHome/docker/Gemfile.lock

RUN bundle install

COPY ./project/ /myHome/

WORKDIR /myHome/project
