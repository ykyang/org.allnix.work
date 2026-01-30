# cmake -B linux-x64
# cmake --build linux-x64
# cmake -B win32-x64
# cmake --build win32-x64 --config Release

cmake_minimum_required(VERSION 3.28)
project(TinyCProjects)

# add_compile_options(-std=c2x)

add_executable(greet01)
add_executable(greet02 greet02.c)
add_executable(time01  time01.c)
add_executable(time02  time02.c)

target_sources(greet01
  PRIVATE
    greet01.c
)


