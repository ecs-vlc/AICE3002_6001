#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf autograd1
cp autograd1.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=autograd1-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' autograd1
cp autograd1-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=autograd1-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' autograd1
cp autograd1-handouts.pdf ../../handouts/
git add ../../handouts/
