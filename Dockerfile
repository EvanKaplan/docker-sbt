#
# sbt Dockerfile
#
# https://github.com/hseeberger/docker-sbt
#

# Pull base image
FROM openjdk:8u151-slim

# Env variables
ENV SBT_VERSION 1.1.1

# Install curl
RUN \
  apt-get update && \
  apt-get -y install curl

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

# Define working directory
WORKDIR /root
