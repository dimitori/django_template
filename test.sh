#!/bin/bash

source venv/bin/activate
# TODO: pipenv

set -e

mkdir -p testing
cd testing

rm -Rf django
echo |cookiecutter ../
