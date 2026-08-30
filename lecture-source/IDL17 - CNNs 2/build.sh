#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

cp Architectures.pdf ../../lectures/
git add ../../lectures/

cp Architectures-handouts.pdf ../../slides2per/Architectures-slides2per.pdf
git add ../../slides2per/

cp Architectures-handouts.pdf ../../handouts/
git add ../../handouts/
