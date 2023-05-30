# 使用官方 C++ grpc 基础镜像
FROM grpc/cpp:1.0

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY . .

# 进行项目构建
RUN make

# 为 Docker 容器设置要监听的端口（例如 50051）
EXPOSE 50051

# 设置容器启动时执行的命令（运行 gRPC 服务器）
CMD ["./hellosvr_server"]