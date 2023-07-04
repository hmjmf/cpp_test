docker buildx create --use --name multi-builder --driver docker-container --platform linux/arm64,linux/amd64
docker buildx build --builder multi-builder --platform linux/arm64,linux/amd64 -f Bazel.dockerfile -t ccr.ccs.tencentyun.com/hmjmf/bazelbuild . --push 
# docker push ccr.ccs.tencentyun.com/hmjmf/bazelbuild 