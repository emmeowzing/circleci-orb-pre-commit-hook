#! /usr/bin/env bash

if ! command -v circleci &> /dev/null
then
    echo "Circleci CLI could not be found. Install the latest CLI version https://circleci.com/docs/2.0/local-cli/#overview"
    exit 1
fi

orb="$(mktemp -p .)"
circleci orb pack "$@" > "$orb"

circleci orb validate "$orb"
exitCode="$?"

rm "${orb:?}"

exit "$exitCode"
