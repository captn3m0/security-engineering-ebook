#!/bin/bash

COVER_URL=https://www.cl.cam.ac.uk/~rja14/Papers/SEv3-cover.jpg

# wget --timestamping  "$COVER_URL" --output-document cover.jpg
# convert cover.jpg cover.pdf

wget --timestamping --input-file "urls.txt"

pdftk cover.pdf SEv3-pref-May16.pdf SEv3-ch1-dec18.pdf \
      SEv3-ch2-dec18.pdf SEv3-ch3-dec18.pdf SEv3-ch4-dec18.pdf \
      SEv3-ch5-dec18.pdf SEv3-ch6-dec18.pdf SEv3-ch7-dec18.pdf \
      SEv3-ch8-dec18.pdf SEv3-ch9-dec18.pdf SEv3-ch10-dec18.pdf \
      SEv3-ch11-jan7.pdf SEv3-ch13-dec18.pdf SEv3-ch14-dec20.pdf \
      SEv3-ch15-dec18.pdf SEv3-ch16-dec18.pdf SEv3-ch17-dec20.pdf \
      SEv3-ch18-dec18.pdf SEv3-ch19-dec18.pdf SEv3-ch26-dec18.pdf \
      SEv3-bib-jan7.pdf cat output temp.pdf

echo "InfoBegin" > meta.txt
echo "InfoKey: Title" >> meta.txt
echo "InfoValue: Security Engineering — Third Edition" >> meta.txt

echo "InfoBegin" >> meta.txt
echo "InfoKey: Author" >> meta.txt
echo "InfoValue: Ross Anderson" >> meta.txt

## We start from page 2 because first is cover and it is not included in urls.txt
PAGE_NUM=2
echo "BookmarkBegin" >> meta.txt
echo "BookmarkTitle: Cover" >> meta.txt
echo "BookmarkLevel: 1" >> meta.txt
echo "BookmarkPageNumber: 1" >> meta.txt

input="urls.txt"
while IFS= read -r line
do
    FILENAME=$(basename "$line")
    PAGES=$(qpdf --show-npages "$FILENAME")

    echo "BookmarkBegin" >> meta.txt
    echo "BookmarkTitle: $FILENAME" >> meta.txt
    echo "BookmarkLevel: 1" >> meta.txt
    echo "BookmarkPageNumber: $PAGE_NUM" >> meta.txt
    PAGE_NUM=$((PAGE_NUM+PAGES))
done < "$input"

pdftk temp.pdf update_info meta.txt output security-engineering-3rd-edition.pdf

rm temp.pdf