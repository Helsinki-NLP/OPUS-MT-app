#!/usr/bin/env bash

#target_dir=translateLocally_logo_ico
#input_file=translateLocally_logo
#output_file=translateLocally_logo.ico

target_dir=opus_mt_ico
input_file=opus_mt
output_file=opus_mt.ico


mkdir -p $target_dir
for i in 16 32 64 128 256 512 1024 
do
convert $input_file.png -resize $i $target_dir/${input_file}_${i}.png
done


## TODO: I don't seem to have the tool magick ..
##       can we just use convert?
# produce ico
# magick convert $target_dir/${input_file}_16.png  \
#               $target_dir/${input_file}_32.png  \
#               $target_dir/${input_file}_64.png  \
#               $target_dir/${input_file}_128.png \
#               $target_dir/${input_file}_256.png \
#               $target_dir/${input_file}_512.png \
#               $target_dir/${input_file}_1024.png $output_file

convert $target_dir/${input_file}_16.png  \
               $target_dir/${input_file}_32.png  \
               $target_dir/${input_file}_64.png  \
               $target_dir/${input_file}_128.png \
               $target_dir/${input_file}_256.png \
               $target_dir/${input_file}_512.png \
               $target_dir/${input_file}_1024.png $output_file


rm -rf $target_dir
