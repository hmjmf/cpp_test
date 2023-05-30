load("@rules_proto//proto:defs.bzl", "proto_library")
package(default_visibility = ["//visibility:public"])

proto_library(
    name = "test_proto_lib",
    srcs = [
        "test.proto",
    ],
)
cc_proto_library(
    name = "test_proto_cc",
    deps = [
        ":test_proto_lib",
    ],
)

cc_binary(
    name = "main",
    srcs = [
        "main.cpp",
    ],
    copts = [
        "-std=c++17",
        "-Wall",
        "-Werror",
    ],
    visibility = ["//visibility:public"],
    deps = [
      ":test_proto_cc",
    ],
)