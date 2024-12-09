include_guard()

include(sstd_FetchSourceFiles)
find_program(CLANG_FORMAT_EXE clang-format)

function(sstd_target_source_formatter TARGET_NAME)
    if(NOT CLANG_FORMAT_EXE)
        return()
    endif()

    if(NOT TARGET sstd_format_source_files)
        add_custom_target(sstd_format_source_files)
    endif()

    sstd_target_fetch_source_files(${TARGET_NAME})

    add_custom_target(
        sstd_format_source_files_${TARGET_NAME}
        COMMAND "${CLANG_FORMAT_EXE}" -i ${${TARGET_NAME}_SOURCES} ${${TARGET_NAME}_HEADERS}
        WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/.."
    )

    add_dependencies(sstd_format_source_files sstd_format_source_files_${TARGET_NAME})
endfunction()
