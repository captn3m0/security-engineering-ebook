#!/bin/bash

COVER_URL=https://www.cl.cam.ac.uk/~rja14/Papers/SEv3-cover.jpg
FINAL_PDF=security-engineering-3rd-edition.pdf
function assert_installed() {
    for var in "$@"; do
        if ! which $var &> /dev/null; then
            echo "Install $var!"
            exit 1
        fi
    done
}

assert_installed wget pdftk

if [[ $@ == *'--download-cover-image'* ]]; then
  echo "Downloading cover image"
  assert_installed convert
  wget --quiet --timestamping  "$COVER_URL" --output-document cover.jpg
  convert cover.jpg cover.pdf
  echo "Cover Image downloaded and converted to pdf"
fi

echo "Starting PDF download"
wget --quiet --timestamping --input-file "urls.txt"
echo "All PDFs downloaded"

pdftk cover.pdf SEv3-pref-May16.pdf SEv3-ch1-dec18.pdf \
      SEv3-ch2-dec18.pdf SEv3-ch3-dec18.pdf SEv3-ch4-dec18.pdf \
      SEv3-ch5-dec18.pdf SEv3-ch6-dec18.pdf SEv3-ch7-dec18.pdf \
      SEv3-ch8-dec18.pdf SEv3-ch9-dec18.pdf SEv3-ch10-dec18.pdf \
      SEv3-ch11-jan7.pdf SEv3-ch13-dec18.pdf SEv3-ch14-dec20.pdf \
      SEv3-ch15-dec18.pdf SEv3-ch16-dec18.pdf SEv3-ch17-dec20.pdf \
      SEv3-ch18-dec18.pdf SEv3-ch19-dec18.pdf SEv3-ch26-dec18.pdf \
      SEv3-bib-jan7.pdf cat output temp.pdf

echo "PDF files combined"

if [[ $@ == *'--generate-metadata'* ]]; then
  assert_installed qpdf
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
  echo "Metadata updated"
fi

echo "Bookmarks attached to PDF"

pdftk temp.pdf update_info meta.txt output $FINAL_PDF
rm temp.pdf

echo "PDF File generated: $FINAL_PDF"
