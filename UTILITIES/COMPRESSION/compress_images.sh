#!/bin/bash


# AGGRESIVE WEB COMPRESS ALL IMAGES IN CURRENT DIRECTORY AND CONVERT TO webp

mkdir -p compressed

for file in *.{jpg,png,jpeg};
do 
	if [ -f "compressed/$file" ]; then
		echo "Omitting $file (already exits)"
		continue
	fi
	echo "Processing: $file"
	magick "$file" -sampling-factor 4:2:0 -strip -quality 75 -interlace Plane "compressed/${file%.*}.webp";
done

# ONLY COMPRESS TO 80% REPLACING ORIGNAL
#for file in *.{jpg,png,jpeg}; do magick "$file" -quality 80 "$file"; done
