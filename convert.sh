#!/bin/bash

SOURCE='slide.asciidoc'
BASE=`basename "$SOURCE" .asciidoc`
HTML=$BASE.html
PDF=$BASE.pdf

#echo "$SOURCE"
#echo "$HTML"
#echo "$PDF"
#exit

echo asciidoctor-revealjs-linux ./"$SOURCE"
asciidoctor-revealjs-linux ./"$SOURCE"
echo
echo chromium --user-data-dir=`mktemp -d` --headless --print-to-pdf=./"$PDF" file://`pwd`/"$HTML"?print-pdf
chromium --user-data-dir=`mktemp -d` --headless --print-to-pdf=./"$PDF" file://`pwd`/"$HTML"?print-pdf

