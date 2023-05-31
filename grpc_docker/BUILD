load("@rules_proto//proto:defs.bzl", "proto_library")
load("@com_github_grpc_grpc//bazel:cc_grpc_library.bzl", "cc_grpc_library")
load("@com_github_grpc_grpc//bazel:grpc_build_system.bzl", "grpc_proto_library")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//cc:image.bzl", "cc_image")

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

# container_image(
#     name = "hellosvr_server_image",
#     # References container_pull from WORKSPACE (above)
#     base = "@official_ubuntu//image",
#     files = ["//grpc_docker:hellosvr_server"],
#     cmd = ["./hellosvr_server"]
# )

container_image(
    name = "hellosvr_server_image",
    base = "@centos9-stream//image",
    cmd = ["./hellosvr_server"],
    files = [":hellosvr_server"],
)

cc_image(
    name = "cc_image2",
    binary = ":hellosvr_server",
)