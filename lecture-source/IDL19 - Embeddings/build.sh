#!/usr/bin/env bash

set -euo pipefail

mkdir -p ../../lectures ../../slides2per ../../handouts

cp Embeddings.pdf ../../lectures/
git add ../../lectures/Embeddings.pdf

cp Embeddings-handouts.pdf ../../handouts/
git add ../../handouts/

cp Embeddings-handouts.pdf ../../slides2per/Embeddings-slides2per.pdf
git add ../../slides2per/

