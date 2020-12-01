#!/bin/bash -e

pwd
echo -ne "Running with "

python3 --version

echo Creating and populating virtualenv..
mkdir .venv
pipenv install --dev
. .venv/bin/activate

cd src

./manage.py collectstatic
./manage.py migrate
pytest -x

echo Done
