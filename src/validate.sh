#! /usr/bin/env bash
set -e

SRC="${1:-src}"
PREPACK"${2:-false}"

##
# Allow the use of subdirectories to group orb commands and jobs into their own groups.
prepack() {
    local TYP
    TYP="$1"

    cd "$SRC/$TYP/" || exit 1

    for directory in *; do
        if [ -d "${directory}" ] && [ -n "$(ls -A "${directory}")" ]; then
            for f in "${directory}"/*; do
                fname="$(basename "$f")"
                if [ ! -f "${directory}-${fname}" ]; then
                    cp "${f}" "${directory}-${fname}"
                fi
            done
        else
            printf "INFO: Ignoring '%s', module is empty.\\n" "${SRC}/${TYP}/${directory}"
        fi
    done

    cd - || exit 1
}

if ! command -v circleci &>/dev/null; then
    echo "Circleci CLI could not be found. Install the latest CLI version https://circleci.com/docs/2.0/local-cli/#overview"
    exit 1
fi

if $PREPACK; then
    prepack "commands"
    prepack "jobs"
fi

circleci orb validate <(circleci orb pack "$@") >/dev/null

unset -f prepack
unset PREPACK
