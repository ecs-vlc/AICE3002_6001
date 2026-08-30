#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf autoencoders
cp autoencoders.pdf ../../lectures/
git add ../../lectures/

latexmk -jobname=autoencoders-slides2per -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' autoencoders
cp autoencoders-slides2per.pdf ../../slides2per/
git add ../../slides2per/

latexmk -jobname=autoencoders-handouts -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' autoencoders
cp autoencoders-handouts.pdf ../../handouts/
git add ../../handouts/
