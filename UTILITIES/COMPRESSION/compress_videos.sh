#!/bin/bash

# MAX COMPRESS TO ALL MP4 VIDEOS IN FOLDER, SAVE IN compressed
# IF FILE WITH SAME NAME IS FOUND IN compressed, TAKE AS ALREADY COMPRESSED AND SKIP IT

mkdir -p compressed

for file in *.mp4
do

	if [ -f "compressed/$file" ]; then
		echo "Omitting $file (already exits)"
		continue
	fi

	echo "Processing: $file"
	ffmpeg -i "$file" -c:v libx265 -crf 30 -preset slow -c:a aac -b:a 128k "compressed/$file"
done

