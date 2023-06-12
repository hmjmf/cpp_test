cp -r ../grpc_test /tmp && \
docker run -v /tmp/grpc_test:/tmp/grpc_test -w /tmp/grpc_test ccr.ccs.tencentyun.com/hmjmf/bazelbuild:latest /bin/sh -c "/bazel build hellosvr_server && cp bazel-bin/hellosvr_server ." && \
dokcer build -t ccr.ccs.tencentyun.com/hmjmf/hellosvr_server /tmp/grpc_test &&
dokcer push ccr.ccs.tencentyun.com/hmjmf/hellosvr_server

# docker run -v /tmp/grpc_test:/tmp/grpc_test -w /tmp/grpc_test ccr.ccs.tencentyun.com/hmjmf/bazelbuild:latest \
#     "/bazel build hellosvr_server && \
#     chmod 555 bazel-bin/hellosvr_server && \
#     cp bazel-bin/hellosvr_server . && \
#     docker build . -t ccr.ccs.tencentyun.com/hmjmf/hellosvr_server && \
#     dokcer push ccr.ccs.tencentyun.com/hmjmf/hellosvr_server
#     "