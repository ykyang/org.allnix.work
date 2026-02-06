## Linux
# cmake -B linux-x64
# cmake --build linux-x64
## MSVC
# cmake -B win32-x64
# cmake --build win32-x64 --config Release
## clang on Windows
# cmake -G "Visual Studio 17 2022" -T "ClangCL" -B win32-x64
# cmake --build win32-x64 --config Release

cmake_minimum_required(VERSION 3.28)
project(TinyCProjects)

#add_compile_options(-std=c2x)
if (UNIX)
    add_compile_options(-std=c2x)
endif()
if(MSVC)
#    add_compile_options(/std:clatest)
endif()
if (WIN32)
    if (CMAKE_C_COMPILER_ID MATCHES "Clang")
        add_compile_options(/clang:-std=c2x) # pass through from clang-cl to clang
    endif()
endif()

add_executable(greet01)
add_executable(greet02 greet02.c)
add_executable(time01  time01.c)
add_executable(time02  time02.c)
add_executable(greet03 greet03.c)
add_executable(greet04 greet04.c)
add_executable(pithy01 pithy01.c)
add_executable(pithy02 pithy02.c)

target_sources(greet01
  PRIVATE
    greet01.c
)


