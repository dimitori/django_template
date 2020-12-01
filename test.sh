#!/bin/bash

set -e

mkdir -p testing
cd testing

rm -Rf django_template
echo |cookiecutter -v ../
