# /test/StampfileGeneratedForUnusedFunctionCheck.cmake
# Sets up an unused function check target so we can check if a stampfile
# is generated later in the build process.
#
# See LICENCE.md for Copyright Information.

include (${CPPCHECK_COMMON_UNIVERSAL_CMAKE_DIRECTORY}/CPPCheck.cmake)
include (${CPPCHECK_COMMON_UNIVERSAL_CMAKE_TESTS_DIRECTORY}/CMakeUnit.cmake)

find_program (CPPCHECK_EXECUTABLE cppcheck)

set (SOURCES
     ${CMAKE_CURRENT_SOURCE_DIR}/FirstSource.cpp)
file (WRITE ${SOURCES} "")

cppcheck_add_to_unused_function_check (global
                                       SOURCES ${SOURCES})

cppcheck_add_unused_function_check_with_name (global)

set (STAMPFILE ${CMAKE_CURRENT_BINARY_DIR}/global.stamp)

assert_has_property_with_value (SOURCE ${STAMPFILE}
                                GENERATED
                                INTEGER
                                EQUAL
                                1)