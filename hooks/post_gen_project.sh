#!/bin/bash -e

echo -ne "Running with "

python --version

echo Creating and populating virtualenv..
mkdir .venv
export PIPENV_VENV_IN_PROJECT="enabled"
pipenv install
pipenv shell

cd src

./manage.py collectstatic
./manage.py migrate
pytest -x

echo Done
