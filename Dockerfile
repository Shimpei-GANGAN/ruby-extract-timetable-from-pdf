FROM ruby:3.1.2-slim-bullseye

# TODO: Builderイメージを作成したい
# Python・Java環境構築
RUN apt update \
  && apt upgrade -y \
  && apt install -y --no-install-recommends \
    openjdk-11-jdk python3 python3-pip \
  && apt autoclean \
  && rm -rf /var/lib/apt/lists/*

# aliasの設定
RUN echo -e "alias python='python3'\nalias pip='pip3'" >> ~/.bashrc \
  && source ~/.bashrc

# Pythonライブラリのインストール
WORKDIR /app
COPY ./python ./python
RUN pip install -r ./python/requirements.txt

# Ruby環境構築
COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install