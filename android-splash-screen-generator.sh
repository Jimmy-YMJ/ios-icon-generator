#!/bin/bash
#
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

SRC_FILE="$1"
DST_PATH="$2"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 2 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

info 'Generate splash-port-ldpi.png ...'
convert "$SRC_FILE" -resize 320x320 -crop 200x320+60+0 "$DST_PATH/splash-port-ldpi.png"
info 'Generate splash-port-mdpi.png ...'
convert "$SRC_FILE" -resize 480x480 -crop 320x480+80+0 "$DST_PATH/splash-port-mdpi.png"
info 'Generate splash-port-hdpi.png ...'
convert "$SRC_FILE" -resize 800x800 -crop 480x800+160+0 "$DST_PATH/splash-port-hdpi.png"
info 'Generate splash-port-xhdpi.png ...'
convert "$SRC_FILE" -resize 1280x1280 -crop 720x1280+280+0 "$DST_PATH/splash-port-xhdpi.png"
info 'Generate splash-port-xxhdpi.png ...'
convert "$SRC_FILE" -resize 1600x1600 -crop 960x1600+320+0 "$DST_PATH/splash-port-xxhdpi.png"
info 'Generate splash-port-xxxhdpi.png ...'
convert "$SRC_FILE" -resize 1920x1920 -crop 1280x1920+320+0 "$DST_PATH/splash-port-xxxhdpi.png"


info 'Generate splash-land-ldpi.png ...'
convert "$SRC_FILE" -resize 320x320 -crop 320x200+0+60 "$DST_PATH/splash-land-ldpi.png"
info 'Generate splash-land-mdpi.png ...'
convert "$SRC_FILE" -resize 480x480 -crop 480x320+0+80 "$DST_PATH/splash-land-mdpi.png"
info 'Generate splash-land-hdpi.png ...'
convert "$SRC_FILE" -resize 800x800 -crop 800x480+0+160 "$DST_PATH/splash-land-hdpi.png"
info 'Generate splash-land-xhdpi.png ...'
convert "$SRC_FILE" -resize 1280x1280 -crop 1280x720+0+280 "$DST_PATH/splash-land-xhdpi.png"
info 'Generate splash-land-xxhdpi.png ...'
convert "$SRC_FILE" -resize 1600x1600 -crop 1600x960+0+320 "$DST_PATH/splash-land-xxhdpi.png"
info 'Generate splash-land-xxxhdpi.png ...'
convert "$SRC_FILE" -resize 1920x1920 -crop 1920x1280+0+320 "$DST_PATH/splash-land-xxxhdpi.png"

info 'Generate Done.'
