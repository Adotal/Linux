#!/bin/bash

# SCRIPT TO COMPRESS ALL FILES IN FOLDER WITH GHOSTSCRIPT AND SAVE IN compressed/ 

mkdir -p compressed
for file in *.pdf
do
	if [ -f "compressed/$file" ]; then
		echo "Omitting $file (already exits)"
		continue
	fi

	echo "Processing: $file"

	# GHOSCRIPT IS SLIGHTLY BETTER THAN QPDF BUT CONSIDERABLY SLOWER
	# qpdf --compress-streams=y --recompress-flate --optimize-images "$file" "compressed/$file"
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="compressed/$file" "$file"
done


