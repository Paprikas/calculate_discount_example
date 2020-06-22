FROM ruby:2.7.1

MAINTAINER Maxim Zelenkin <nudepatch@gmail.com>

RUN apt update -q && apt install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nano > /dev/null

ENV APP_PATH /app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

ENV BUNDLE_PATH /bundle
ENV GEM_HOME /bundle
ENV PATH="/bundle/bin:${PATH}"

RUN echo 'alias dp="bundle exec cap production deploy"' >> ~/.bashrc
RUN echo 'alias sdp="bundle exec cap staging deploy"' >> ~/.bashrc
RUN echo 'alias rc="bundle exec rails console"' >> ~/.bashrc
RUN echo 'alias be="bundle exec"' >> ~/.bashrc
RUN echo 'alias rg="bundle exec rails generate"' >> ~/.bashrc
RUN echo 'alias credit="EDITOR=nano bundle exec rails credentials:edit"' >> ~/.bashrc

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
