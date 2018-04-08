#!/usr/bin/env bash

set -x
set -e

sudo apt-get install python3-virtualenv virtualenv screen unzip nginx docker.io curl net-tools gcc git make sudo vim zip python3-dev python3-pip -y
sudo apt-get install python3-numpy python3-qt4 python3-lxml python3-six -y


sudo docker pull scrapinghub/splash
sudo docker run -p 8050:8050 -p 5023:5023 scrapinghub/splash --disable-ui --disable-lua

if [ -z "$VIRTUAL_ENV" ]; then
    virtualenv -p python3 venv

    . ./venv/bin/activate
fi

pip install -r requirements.txt
pip install -e .
pip install uwsgi
pip install --upgrade ete3
ete3 upgrade-external-tools

wget https://d3js.org/d3.v5.min.js -O lookyloo/static/d3.v5.min.js
wget https://cdn.rawgit.com/eligrey/FileSaver.js/5733e40e5af936eb3f48554cf6a8a7075d71d18a/FileSaver.js -O lookyloo/static/FileSaver.js


