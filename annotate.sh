#!/usr/bin/env bash
# 2016 Redyz - MIT License
# Simple annotation script used in mapGen, requires a font in "$PWD/fonts/"
#
#
# Usage: ./script image_file.png "Something that goes on top of the image"
# Resulting image is written to result.png

image_file=$1
annotation=$2
result=result.png

font_size=50
width=$(identify -format "%w" $image_file)
end_height=$(identify -format "%h" $image_file)
height=$(echo $end_height-$font_size-$font_size-3 | bc)
end_height=$(echo $end_height-$font_size | bc)
text_offset=$(echo $height+5 | bc);
convert $image_file \
	-fill '#222B' \
  -gravity north \
  -draw "rectangle 0,$height, $width,$end_height" \
  -font "fonts/GohuFont-Powerline.ttf" \
	-pointsize $font_size \
  -fill white \
  -annotate +0+$text_offset "$annotation" $result

