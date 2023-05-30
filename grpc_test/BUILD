load("@rules_proto//proto:defs.bzl", "proto_library")
load("@com_github_grpc_grpc//bazel:cc_grpc_library.bzl", "cc_grpc_library")
load("@com_github_grpc_grpc//bazel:grpc_build_system.bzl", "grpc_proto_library")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "hellosvr_proto",
    srcs = ["hellosvr.proto"],
)

cc_proto_library(
    name = "hellosvr_cc_proto",
    deps = [":hellosvr_proto"],
)

cc_grpc_library(
    name = "hellosvr_cc_grpc",
    srcs = [":hellosvr_proto"],
    grpc_only = True,
    deps = [":hellosvr_cc_proto"],
)

cc_binary(
    name = "hellosvr_client",
    srcs = ["hellosvr_client.cpp"],
    defines = ["BAZEL_BUILD"],
    deps = [
        "@com_github_grpc_grpc//:grpc++",
        ":hellosvr_cc_grpc",
        "@com_google_absl//absl/flags:flag",
        "@com_google_absl//absl/flags:parse",
    ],
)

cc_binary(
    name = "hellosvr_server",
    srcs = ["hellosvr_server.cpp"],
    defines = ["BAZEL_BUILD"],
    deps = [
        "@com_github_grpc_grpc//:grpc++",
        "@com_github_grpc_grpc//:grpc++_reflection",
        ":hellosvr_cc_grpc",
        "@com_google_absl//absl/flags:flag",
        "@com_google_absl//absl/flags:parse",
        "@com_google_absl//absl/strings:str_format",
    ],
)
