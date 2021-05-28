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

assert_installed wget pystitcher

echo "Starting PDF download"
wget --timeout=10 --timestamping --input-file "urls.txt"
echo "All PDFs downloaded"

pystitcher book.md "$FINAL_PDF"
