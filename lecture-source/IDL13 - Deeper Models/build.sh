#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf deepnetworks
cp deepnetworks.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=deepnetworks-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' deepnetworks
cp deepnetworks-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=deepnetworks-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' deepnetworks
cp deepnetworks-handouts.pdf ../../handouts/
git add ../../handouts/
