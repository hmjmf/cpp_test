FROM index.docker.io/twistedbytes/centos9-stream:latest
RUN yum install -y wget
RUN wget https://releases.bazel.build/6.2.1/release/bazel-6.2.1-linux-x86_64
RUN mv bazel-6.2.1-linux-x86_64 bazel
RUN chmod +x bazel