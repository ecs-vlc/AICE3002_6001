#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf differentiate
cp differentiate.pdf ../../lectures/
git add ../../lectures/


latexmk -jobname=differentiate-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' differentiate
cp differentiate-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=differentiate-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' differentiate
cp differentiate-handouts.pdf ../../handouts/
git add ../../handouts/
