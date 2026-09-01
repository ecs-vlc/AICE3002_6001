#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPT_DIR"

mkdir -p ../../../lectures ../../../slides2per ../../../handouts

latexmk -pdf diffprog

latexmk -jobname=diffprog-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' diffprog
latexmk -jobname=diffprog-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' diffprog

cp diffprog-slides2per.pdf ../../../slides2per/diffprog-slides2per.pdf
cp diffprog-handouts.pdf ../../../handouts/
cp diffprog.pdf ../../../lectures/
git add ../../../slides2per/
git add ../../../handouts/
git add ../../../lectures/

magick convert -geometry 1920x1080 -density 320 diffprog.pdf ../diffprog/slides/%04d.png
git add ../diffprog/slides/*
