DIR_PATH=$(pwd)
DIR_NAME=$(basename `pwd`)
BIN_NAME=hellosvr_server
echo "DIR_PATH: ${DIR_PATH}"
echo "DIR_NAME: ${DIR_NAME}"
echo "BIN_NAME: ${BIN_NAME}"
docker run -v ${DIR_PATH}:/tmp/${DIR_NAME} -w /tmp/${DIR_NAME} ccr.ccs.tencentyun.com/hmjmf/bazelbuild:latest /bin/sh -c "/bazel build ${BIN_NAME} && cp bazel-bin/${BIN_NAME} ." && \
docker build -t ccr.ccs.tencentyun.com/hmjmf/${BIN_NAME} ${DIR_PATH} &&
docker push ccr.ccs.tencentyun.com/hmjmf/${BIN_NAME}

# docker run -v /tmp/grpc_test:/tmp/grpc_test -w /tmp/grpc_test ccr.ccs.tencentyun.com/hmjmf/bazelbuild:latest \
#     "/bazel build hellosvr_server && \
#     chmod 555 bazel-bin/hellosvr_server && \
#     cp bazel-bin/hellosvr_server . && \
#     docker build . -t ccr.ccs.tencentyun.com/hmjmf/hellosvr_server && \
#     dokcer push ccr.ccs.tencentyun.com/hmjmf/hellosvr_server
#     "