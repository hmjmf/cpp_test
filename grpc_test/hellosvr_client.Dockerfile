FROM docker.io/library/centos:8

WORKDIR /app

COPY ./hellosvr_client /app/

WORKDIR /app

EXPOSE 50051

CMD ["./hellosvr_client"]



