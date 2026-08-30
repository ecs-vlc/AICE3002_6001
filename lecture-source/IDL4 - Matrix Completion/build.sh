#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf matrix_completion
cp matrix_completion.pdf ../../lectures/
git add ../../lectures/


latexmk -jobname=matrix_completion-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' matrix_completion
cp matrix_completion-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=matrix_completion-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' matrix_completion
cp matrix_completion-handouts.pdf ../../handouts/
git add ../../handouts/
