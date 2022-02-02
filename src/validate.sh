#! /usr/bin/env bash
set -e

if ! command -v circleci &> /dev/null
then
    echo "Circleci CLI could not be found. Install the latest CLI version https://circleci.com/docs/2.0/local-cli/#overview"
    exit 1
fi

circleci orb validate <(circleci orb pack "$@") >/dev/null
