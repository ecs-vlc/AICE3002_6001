#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf mlreview
cp mlreview.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=mlreview-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' mlreview
cp mlreview-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=mlreview-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' mlreview
cp mlreview-handouts.pdf ../../handouts/
git add ../../handouts/
