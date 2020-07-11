#!/bin/bash

COVER_URL=https://www.cl.cam.ac.uk/~rja14/Papers/SEv3-cover.pdf
FINAL_PDF=security-engineering-3rd-edition.pdf
INPUT_FILE="urls.txt"

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
  wget --quiet --timestamping "$COVER_URL" --output-document cover.pdf
  echo "Cover Image downloaded"
fi

declare -a FILES_LIST

while IFS= read -r line
do
    FILENAME=$(basename "$line")
    FILES_LIST+=("$FILENAME")
done < "$INPUT_FILE"

echo "Starting PDF download"
wget --quiet --timestamping --input-file "urls.txt"
echo "All PDFs downloaded"

pdftk cover.pdf ${FILES_LIST[@]} cat output temp.pdf

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

  chapter_id=0
  readarray -t TITLES < titles.txt
  while IFS= read -r line
  do
      FILENAME=$(basename "$line")
      PAGES=$(qpdf --show-npages "$FILENAME")
      BOOKMARK_TITLE="${TITLES[$chapter_id]}"

      echo "BookmarkBegin" >> meta.txt
      echo "BookmarkTitle: $BOOKMARK_TITLE" >> meta.txt
      echo "BookmarkLevel: 1" >> meta.txt
      echo "BookmarkPageNumber: $PAGE_NUM" >> meta.txt
      chapter_id=$((chapter_id+1))
      PAGE_NUM=$((PAGE_NUM+PAGES))
  done < "$INPUT_FILE"
  echo "Metadata updated"
fi

echo "Bookmarks attached to PDF"

pdftk temp.pdf update_info meta.txt output $FINAL_PDF
rm temp.pdf

echo "PDF File generated: $FINAL_PDF"
