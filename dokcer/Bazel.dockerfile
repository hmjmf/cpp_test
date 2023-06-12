# FROM ccr.ccs.tencentyun.com/hmjmf/centos9:latest
FROM docker.io/library/centos:8
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y wget git gcc gcc-c++ && \
    wget https://releases.bazel.build/6.2.1/release/bazel-6.2.1-linux-x86_64 && \
    mv bazel-6.2.1-linux-x86_64 bazel && \
    chmod +x bazel