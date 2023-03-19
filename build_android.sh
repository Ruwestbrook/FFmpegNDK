#!/bin/bash
set -x
# 目标Android版本
#android-ndk-r21d
#ffmpeg - 6.0.7
API=29
ARCH=arm64
CPU=armv8-a
TOOL_CPU_NAME=aarch64
#so库输出目录
OUTPUT=/Users/russell/ffmpeg/android/$CPU
# NDK的路径，根据自己的NDK位置进行设置
NDK=/Users/russell/ffmpeg/android-ndk-r21d
# 编译工具链路径
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64
# 编译环境
SYSROOT=$TOOLCHAIN/sysroot

TOOL_PREFIX="$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-android"
 
CC="$TOOL_PREFIX$API-clang"
CXX="$TOOL_PREFIX$API-clang++"
OPTIMIZE_CFLAGS="-march=$CPU"
function build
{
  ./configure \
  --prefix=$OUTPUT \
  --target-os=android \
  --arch=$ARCH  \
  --cpu=$CPU \
  --disable-asm \
  --enable-neon \
  --enable-cross-compile \
  --enable-shared \
  --enable-gpl \
  --enable-version3 \
  --enable-libsmbclient \
  --disable-static \
  --disable-doc \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-symver \
  --disable-ffmpeg \
  --cc=$CC \
  --cxx=$CXX \
  --sysroot=$SYSROOT \
  --extra-cflags="-Os -fpic $OPTIMIZE_CFLAGS" \

  make clean all
  # 这里是定义用几个CPU编译
  make -j8
  make install
}
build