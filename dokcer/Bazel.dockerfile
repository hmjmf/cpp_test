# FROM ccr.ccs.tencentyun.com/hmjmf/centos9:latest
FROM docker.io/library/centos:8
ARG TARGETARCH
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y wget git gcc gcc-c++ && \
    platform_name=$TARGETARCH && if [ "$platform_name" == "amd64" ]; then platform_name="x86_64"; fi && echo $platform_name && \
    wget https://releases.bazel.build/6.2.1/release/bazel-6.2.1-linux-${platform_name} && \
    mv bazel-6.2.1-linux-${platform_name} bazel && \
    chmod +x bazel