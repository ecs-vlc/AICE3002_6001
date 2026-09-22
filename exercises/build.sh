#!/usr/bin/env bash
set -euo pipefail

for exercise in exercise1 exercise2 exercise3 exercise4; do
    (cd "$exercise" && ./build.sh)
done

