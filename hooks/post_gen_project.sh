#!/bin/bash -e

pwd
echo -ne "Running with "

python3 --version

echo Creating and populating virtualenv..
mkdir .venv
pipenv install --dev
. .venv/bin/activate

cd src

echo Collecting static assets...
./manage.py collectstatic

echo Running initial migrations...
./manage.py migrate

echo Running flake8...
flake8

echo Running pytest...
pytest -x

echo Done
