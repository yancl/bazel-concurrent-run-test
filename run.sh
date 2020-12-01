#!/bin/bash

set -e

docker run -v/tmp/cache:/root/.cache/bazel -it --rm bazel-concurrent-run-test:v0.0.1 bazel test //...
