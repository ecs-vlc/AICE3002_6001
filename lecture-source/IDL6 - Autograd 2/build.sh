#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

SOURCE_NAME=autograd
OUTPUT_NAME=autograd2

latexmk -jobname="$OUTPUT_NAME" -pdf "$SOURCE_NAME"
cp "$OUTPUT_NAME.pdf" "../../lectures/$OUTPUT_NAME.pdf"
git add "../../lectures/$OUTPUT_NAME.pdf"

latexmk -jobname="$OUTPUT_NAME-slides2per" -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' "$SOURCE_NAME"
cp "$OUTPUT_NAME-slides2per.pdf" "../../slides2per/$OUTPUT_NAME-slides2per.pdf"
git add "../../slides2per/$OUTPUT_NAME-slides2per.pdf"

latexmk -jobname="$OUTPUT_NAME-handouts" -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' "$SOURCE_NAME"
cp "$OUTPUT_NAME-handouts.pdf" "../../handouts/$OUTPUT_NAME-handouts.pdf"
git add "../../handouts/$OUTPUT_NAME-handouts.pdf"
