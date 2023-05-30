load("@com_github_grpc_ecosystem_grpc_gateway//protoc-gen-openapiv2:defs.bzl", "protoc_gen_openapiv2")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
# load("@com_github_grpc_ecosystem_grpc_gateway//proto:def.bzl", "go_proto_gateway_library")
# load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

proto_library(
    name = "hellosvr_proto",
    srcs = ["hellosvr.proto"],
    visibility = ["//visibility:public"],
    deps = [
        "@googleapi//:annotations_proto",
    ]
)

go_proto_library(
    name = "hellosvr_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "cpp_test/grep_gateway",
    proto = ":hellosvr_proto",
    visibility = ["//visibility:public"],
)

protoc_gen_openapiv2(
    name = "hellosvr_swagger",
    proto = ":hellosvr_proto",
)