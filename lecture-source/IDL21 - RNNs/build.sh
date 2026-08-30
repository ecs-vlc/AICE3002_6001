#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf rnns
cp rnns.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=rnns-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' rnns
cp rnns-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=rnns-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' rnns
cp rnns-handouts.pdf ../../handouts/
git add ../../handouts/
