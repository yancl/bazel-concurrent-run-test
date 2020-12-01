FROM ubuntu:16.04

ARG BAZEL_VERSION=3.7.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    openssl \
    ca-certificates \
    curl  \
    unzip && \
    curl -LO "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh" && \
    chmod +x bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh && \
    ./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh --user && \
    ln -s /root/bin/bazel /usr/local/bin/bazel

COPY WORKSPACE BUILD test.sh /demo/

WORKDIR /demo
