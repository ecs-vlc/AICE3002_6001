#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

cp NewConvolution.pdf ../../lectures/
git add ../../lectures/NewConvolution.pdf

cp NewConvolution-handouts.pdf ../../slides2per/NewConvolution-slides2per.pdf
git add ../../slides2per/

cp NewConvolution-handouts.pdf ../../handouts/
git add ../../handouts/
