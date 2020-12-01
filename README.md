# bazel-concurrent-run-test

## Build docker image
$ ./build.sh

## Test multiple bazel server run simultaneously of **same** server pid
* session a: 
```
$ ./run.sh
Starting local Bazel server and connecting to it...
INFO: Analyzed target //:test (21 packages loaded, 227 targets configured).
INFO: Found 1 test target...
[4 / 5] Testing //:test; 53s processwrapper-sandbox
```

* session b(NOTE: session b should ./run.sh after session a in **execution** phase):
```
$ ./run.sh
Starting local Bazel server and connecting to it...
INFO: Analyzed target //:test (21 packages loaded, 227 targets configured).
INFO: Found 1 test target...
INFO: Deleting stale sandbox base /root/.cache/bazel/_bazel_root/53a21a31163cea6582840a4862f776cf/sandbox
[4 / 5] Testing //:test; 5s processwrapper-sandbox

```

## Test multiple bazel server run simultaneously of **different** server pid
* session a(bazel exit after anothor bazel server start):
```
$ ./run.sh
Starting local Bazel server and connecting to it...
INFO: Analyzed target //:test (21 packages loaded, 227 targets configured).
INFO: Found 1 test target...
[4 / 5] Testing //:test; 13s processwrapper-sandbox

Server terminated abruptly (error code: 14, error message: 'Socket closed', log file: '/root/.cache/bazel/_bazel_root/53a21a31163cea6582840a4862f776cf/server/jvm.out')

```

* session b:
```
$ ./run-broken.sh
just to use different pid
Starting local Bazel server and connecting to it...
INFO: Analyzed target //:test (21 packages loaded, 227 targets configured).
INFO: Found 1 test target...
INFO: Deleting stale sandbox base /root/.cache/bazel/_bazel_root/53a21a31163cea6582840a4862f776cf/sandbox
[4 / 5] Testing //:test; 41s processwrapper-sandbox

```
