#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
    printf 'Usage: %s SOURCE_DIRECTORY JOB_NAME\n' "$(basename "$0")" >&2
    exit 2
fi

SOURCE_DIR="$(cd "$1" && pwd)"
JOB_NAME="$2"

if [[ ! "$JOB_NAME" =~ ^[A-Za-z0-9_-]+$ ]]; then
    printf 'Invalid LaTeX job name: %s\n' "$JOB_NAME" >&2
    exit 2
fi

cd "$SOURCE_DIR"
mkdir -p ../../lectures ../../slides2per ../../handouts

latexmk -pdf "$JOB_NAME"
cp "$JOB_NAME.pdf" ../../lectures/
git add ../../lectures/

latexmk \
    -jobname="$JOB_NAME-slides2per" \
    -pdf \
    -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\beamerclass{handout}\input{%S}"' \
    "$JOB_NAME"
cp "$JOB_NAME-slides2per.pdf" ../../slides2per/
git add ../../slides2per/

latexmk \
    -jobname="$JOB_NAME-handouts" \
    -pdf \
    -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\def\articlemode{articlemode}\input{%S}"' \
    "$JOB_NAME"
cp "$JOB_NAME-handouts.pdf" ../../handouts/
git add ../../handouts/
