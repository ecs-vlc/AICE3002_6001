#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

usage() {
    cat <<EOF
Usage: $(basename "$0") [build|clean]

  build  Build every available lecture and copy the outputs (default).
  clean  Remove LaTeX compiler intermediates from lecture-source.

The clean command preserves PDFs and all source assets.
EOF
}

clean_latex_sources() {
    cleaned=0

    while IFS= read -r -d '' artifact; do
        printf 'Removing %s\n' "${artifact#"$SCRIPT_DIR/"}"
        rm -f -- "$artifact"
        ((cleaned += 1))
    done < <(
        find "$SCRIPT_DIR" -type f \( \
            -name '*.aux' -o \
            -name '*.bbl' -o \
            -name '*.bcf' -o \
            -name '*.blg' -o \
            -name '*.dvi' -o \
            -name '*.fdb_latexmk' -o \
            -name '*.fls' -o \
            -name '*.lof' -o \
            -name '*.log' -o \
            -name '*.lot' -o \
            -name '*.nav' -o \
            -name '*.out' -o \
            -name '*.run.xml' -o \
            -name '*.snm' -o \
            -name '*.synctex.gz' -o \
            -name '*.toc' -o \
            -name '*.vrb' -o \
            -name '*.xdv' -o \
            -name '*-blx.bib' \
        \) -print0
    )

    printf 'Removed %d LaTeX build artefacts.\n' "$cleaned"
}

command="${1:-build}"

case "$command" in
    clean)
        clean_latex_sources
        exit 0
        ;;
    build)
        ;;
    -h|--help|help)
        usage
        exit 0
        ;;
    *)
        printf 'Unknown command: %s\n\n' "$command" >&2
        usage >&2
        exit 2
        ;;
esac

mkdir -p \
    "$OUTPUT_DIR/lectures" \
    "$OUTPUT_DIR/slides2per" \
    "$OUTPUT_DIR/handouts"

built=0

for sequence in $(seq 1 99); do
    for lecture_dir in "$SCRIPT_DIR/IDL${sequence} - "*; do
        [[ -d "$lecture_dir" ]] || continue

        if [[ -f "$lecture_dir/build.sh" ]]; then
            build_script="$lecture_dir/build.sh"
        elif [[ -f "$lecture_dir/tex/build.sh" ]]; then
            build_script="$lecture_dir/tex/build.sh"
        else
            continue
        fi

        printf 'Building %s\n' "${lecture_dir#"$SCRIPT_DIR/"}"
        (
            cd "$(dirname "$build_script")"
            bash "$(basename "$build_script")"
        )
        ((built += 1))
    done
done

printf 'Built %d lecture source directories.\n' "$built"
