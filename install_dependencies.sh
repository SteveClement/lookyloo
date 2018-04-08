#!/usr/bin/env bash

set -x
set -e

sudo apt-get install python3-virtualenv virtualenv screen unzip docker.io curl net-tools gcc git make sudo vim zip python3-dev -y

sudo docker pull scrapinghub/splash
sudo docker run -d -p 8050:8050 -p 5023:5023 scrapinghub/splash --disable-ui --disable-lua

if [ -z "$VIRTUAL_ENV" ]; then
    virtualenv -p python3 venv
    . ./venv/bin/activate
fi

pip install -rU requirements.txt
pip install -e .
pip install uwsgi
pip install --upgrade ete3 numpy

wget https://d3js.org/d3.v5.min.js -O lookyloo/static/d3.v5.min.js
wget https://cdn.rawgit.com/eligrey/FileSaver.js/5733e40e5af936eb3f48554cf6a8a7075d71d18a/FileSaver.js -O lookyloo/static/FileSaver.js
