#!/bin/sh

FINAL_PDF=security-engineering-3rd-edition.pdf

function assert_installed() {
    for var in "$@"; do
        if ! which $var &> /dev/null; then
            echo "Install $var!"
            exit 1
        fi
    done
}

assert_installed pystitcher

pystitcher book.md "$FINAL_PDF"
