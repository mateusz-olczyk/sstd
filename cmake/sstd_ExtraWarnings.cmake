include_guard()

function(sstd_target_extra_warnings TARGET_NAME)
    if(NOT SSTD_EXTRA_WARNINGS)
        return()
    endif()

    set(
        TARGET_COMPILE_OPTIONS
        $<$<CXX_COMPILER_ID:Clang,GNU>:-Wall -Wextra -Wmissing-declarations -Wsign-conversion -Wpedantic -Wshadow -Werror>
        $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX>
    )

    get_target_property(TARGET_TYPE ${TARGET_NAME} TYPE)
    if("${TARGET_TYPE}" STREQUAL "INTERFACE_LIBRARY")
        target_compile_options(${TARGET_NAME} INTERFACE "${TARGET_COMPILE_OPTIONS}")
    else()
        target_compile_options(${TARGET_NAME} PUBLIC "${TARGET_COMPILE_OPTIONS}")
    endif()
endfunction()
