
cmake_minimum_required(VERSION 3.11)

if(EXISTS ${CMAKE_SOURCE_DIR}/conan/conanbuildinfo.cmake)
    include(${CMAKE_SOURCE_DIR}/conan/conanbuildinfo.cmake)
    conan_basic_setup()
endif()
set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )

add_executable(main)
target_sources(main
    PUBLIC
    ${CMAKE_SOURCE_DIR}/src/main.cpp
)
target_include_directories(main
    PUBLIC
    ${CMAKE_SOURCE_DIR}/src
)
target_compile_features( main
    PRIVATE
    cxx_range_for
)
if(EXISTS ${CMAKE_SOURCE_DIR}/conan/conanbuildinfo.cmake)
    target_link_libraries(main
        ${CONAN_LIBS}
    )
endif()
