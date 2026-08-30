#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf lstm
cp lstm.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=lstm-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' lstm
cp lstm-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=lstm-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' lstm
cp lstm-handouts.pdf ../../handouts/
git add ../../handouts/
