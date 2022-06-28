# syntax = docker/dockerfile:experimental
ARG FLAVOR=bullseye
ARG DEBIAN_BASE_TAG=sha-e8e6f7512fdb9c3f17367622d2b130c912a1d5bf

FROM ghcr.io/lutriseng/debian-base/${FLAVOR}:${DEBIAN_BASE_TAG} AS ruby-base

COPY imagedate.txt /

ARG RBENV_VERSION=1.2.0
RUN git clone --depth 1 --branch v${RBENV_VERSION} https://github.com/rbenv/rbenv.git /opt/rbenv
ENV PATH="/opt/rbenv/bin:$PATH"
ENV RBENV_ROOT=/opt/rbenv
RUN mkdir -p "$(rbenv root)"/plugins
ARG RUBY_BUILD_VERSION=20220610
RUN git clone --depth 1 --branch v${RUBY_BUILD_VERSION} https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

ARG RUBY_VERSION=3.1.2
RUN rbenv install ${RUBY_VERSION} \
 && rbenv global ${RUBY_VERSION} \
 && rbenv rehash