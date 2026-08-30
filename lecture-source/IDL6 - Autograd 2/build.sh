#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf autograd
cp autograd.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=autograd-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' autograd
cp autograd-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=autograd-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' autograd
cp autograd-handouts.pdf ../../handouts/
git add ../../handouts/
