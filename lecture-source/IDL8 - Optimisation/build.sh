#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf optimisation
cp optimisation.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=optimisation-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' optimisation
cp optimisation-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=optimisation-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' optimisation
cp optimisation-handouts.pdf ../../handouts/
git add ../../handouts/
