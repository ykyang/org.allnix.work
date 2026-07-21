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

## Chapter 1 and 2
#add_executable(greet01 greet01.c)
#add_executable(greet02 greet02.c)
#add_executable(time01  time01.c)
#add_executable(time02  time02.c)
#add_executable(greet03 greet03.c)
#add_executable(greet04 greet04.c)
#add_executable(pithy01 pithy01.c)
#add_executable(pithy02 pithy02.c)
#add_executable(pithy03 pithy03.c)
#add_executable(pithy04 pithy04.c)
#add_executable(pithy05 pithy05.c)
## Chapter 3
#add_executable(nato01 nato01.c)
#add_executable(nato02 nato02.c)
#add_executable(word_parse01 word_parse01.c)
#add_executable(nato03 nato03.c)
#add_executable(nato04 nato04.c)
#add_executable(nato05 nato05.c)
## Chapter 4
add_executable(stream_demo stream_demo.c)
add_executable(buffering   buffering.c  )



## Another way to specify sources
#add_executable(foobar)
#target_sources(foobar
#  PRIVATE
#    foobar.c
#)


