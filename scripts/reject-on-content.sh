#!/bin/bash

content=""
files=()

while [[ $# -gt 0 ]]; do
    case "$1" in
        --content=*)
            content="${1#--content=}"
            shift
            ;;
        *)
            files+=("$1")
            shift
            ;;
    esac
done

if [[ -z "$content" ]]; then
    echo "Error: Missing required argument '--content=...'"
    exit 2
fi

for file in "${files[@]}"; do
    if grep -qF "$content" "$file"; then
        echo "Error: File '$file' contains forbidden string: $content"
        exit 1
    fi
done

exit 0
