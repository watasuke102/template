cmake_minimum_required (VERSION 3.0)

set(PROJECT_NAME DxLib)
project(${PROJECT_NAME} CXX)
set(CMAKE_CXX_FLAGS "-DDX_GCC_COMPILE -DDX_NON_INLINE_ASM")

set (SOURCE_FILES
    "./src/main.cpp"
)
include_directories(
    "./inc"
    "./lib"
)
link_directories("./lib")

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME}
    -lDxLib
    -lDxUseCLib
    -lDxDrawFunc
    -ljpeg
    -lpng
    -lzlib
    -ltiff
    -ltheora_static
    -lvorbis_static
    -lvorbisfile_static
    -logg_static
    -lbulletdynamics
    -lbulletcollision
    -lbulletmath
    -lopusfile
    -lopus
    -lsilk_common
    -lcelt
)