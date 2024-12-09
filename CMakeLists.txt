cmake_minimum_required(VERSION 3.20)

project(
    sstd
    VERSION 0.1
    DESCRIPTION "Secure Standard Library for C++"
    HOMEPAGE_URL "https://github.com/mateusz-olczyk/sstd"
    LANGUAGES CXX
)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(SSTD_EXTRA_WARNINGS "Turn on all compilation warnings when linking to sstd library" ON)
option(SSTD_INCLUDE_TESTS "Include tests in the build configuration" ON)

add_subdirectory(lib)

if(SSTD_INCLUDE_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()
