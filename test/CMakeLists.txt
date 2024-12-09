include(FetchContent)
include(GoogleTest)
include(sstd_SourceFormatter)

FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG        v1.15.2
)
FetchContent_MakeAvailable(googletest)

add_executable(sstd_test src/test_memory.cpp)
target_link_libraries(sstd_test PRIVATE sstd GTest::gtest_main)
sstd_target_source_formatter(sstd_test)
gtest_discover_tests(sstd_test)
