#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf autograd2
cp autograd2.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=autograd2-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' autograd2
cp autograd2-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=autograd2-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' autograd2
cp autograd2-handouts.pdf ../../handouts/
git add ../../handouts/
