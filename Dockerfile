FROM ruby:3.1.2-slim-bullseye

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install