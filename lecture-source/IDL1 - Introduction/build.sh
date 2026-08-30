#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf intro
cp intro.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=intro-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' intro
cp intro-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=intro-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' intro
cp intro-handouts.pdf ../../handouts/
git add ../../handouts/
