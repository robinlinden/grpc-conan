cmake_minimum_required(VERSION 3.15)

project(grpc_conan)

include(cmake/conan.cmake)

include(FetchContent)

FetchContent_Declare(grpc
    URL https://github.com/grpc/grpc/archive/v1.30.0.tar.gz
)

set(gRPC_CARES_PROVIDER "package" CACHE INTERNAL "")
set(gRPC_PROTOBUF_PROVIDER "package" CACHE INTERNAL "")
set(gRPC_SSL_PROVIDER "package" CACHE INTERNAL "")
set(gRPC_ZLIB_PROVIDER "package" CACHE INTERNAL "")

FetchContent_MakeAvailable(grpc)

