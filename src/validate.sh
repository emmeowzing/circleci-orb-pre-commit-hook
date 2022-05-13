#! /usr/bin/env bash

set -e

if ! command -v circleci &> /dev/null
then
    echo "Circleci CLI could not be found. Install the latest CLI version https://circleci.com/docs/2.0/local-cli/#overview"
    exit 1
fi

SRC="${1:-src}"
PREPACK="${2:-false}"

# Pre-pack.
if [ "$PREPACK" = "true" ]; then
    # shellcheck disable=SC2038
    find "$SRC" -maxdepth 1 -mindepth 1 -type d | xargs -I % basename % | xargs -I % ./scripts/pre-pack.sh "$SRC" %
fi

orb="$(mktemp -p .)"
circleci orb pack "$SRC" > "$orb"

# Clean up pre-pack.
if [ "$PREPACK" = "true" ]; then
    # shellcheck disable=SC2038
    find "$SRC" -maxdepth 1 -mindepth 1 -type d | xargs -I % basename % | xargs -I % ./scripts/rev-pack.sh "$SRC" %
fi

circleci orb validate "$orb" || true
exitCode="$?"
rm "${orb:?}"
exit "$exitCode"
