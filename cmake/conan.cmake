if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake")
    file(DOWNLOAD
        "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
        "${CMAKE_BINARY_DIR}/conan.cmake"
    )
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(
    REQUIRES
        zlib/1.2.11
        openssl/1.1.1g
        protobuf/3.9.1
        c-ares/1.15.0
        abseil/20200205
    BASIC_SETUP
    CMAKE_TARGETS
    GENERATORS cmake_find_package_multi
    BUILD missing
)

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

function(absl_alias name)
    add_library(${name} INTERFACE IMPORTED)
    target_link_libraries(${name} INTERFACE CONAN_PKG::abseil)
endfunction()

absl_alias(absl::inlined_vector)
absl_alias(absl::memory)
absl_alias(absl::optional)
absl_alias(absl::str_format)
absl_alias(absl::strings)
absl_alias(absl::time)

add_library(c-ares::cares INTERFACE IMPORTED)
target_link_libraries(c-ares::cares INTERFACE CONAN_PKG::c-ares)

