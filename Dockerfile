#
# sbt Dockerfile
#
# https://github.com/hseeberger/docker-sbt
#

# Pull base image
FROM openjdk:10.0.1-slim

# Env variables
ENV SBT_VERSION 1.1.5

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
  apt-get install sbt

# Define working directory
WORKDIR /root
