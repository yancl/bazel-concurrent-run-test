#/bin/bash

set -e

docker build . -t bazel-concurrent-run-test:v0.0.1
