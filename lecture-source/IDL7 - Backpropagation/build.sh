#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf backprop
cp backprop.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=backprop-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' backprop
cp backprop-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=backprop-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' backprop
cp backprop-handouts.pdf ../../handouts/
git add ../../handouts/
