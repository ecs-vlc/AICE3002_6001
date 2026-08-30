#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf attention
cp attention.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=attention-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' attention
cp attention-handouts.pdf ../../handouts/
git add ../../handouts/
