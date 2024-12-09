include(sstd_ExtraWarnings)
include(sstd_SourceFormatter)

add_library(sstd INTERFACE)
target_include_directories(sstd INTERFACE include)
target_compile_definitions(sstd INTERFACE $<$<CONFIG:Debug,RelWithDebInfo>:SSTD_USE_WRAPPERS>)
sstd_target_extra_warnings(sstd)
sstd_target_source_formatter(sstd)
