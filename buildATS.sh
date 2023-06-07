#!/bin/sh

atsastro="$HOME/atsastro2.2";
FES="$HOME/atsastro_frontend_server";
FESD="$HOME/atsastro_frontend_server/data";
VERSION="0.0.1";
IMG="atsastro_frontend_server:$VERSION";

# check if $atsastro exists if $atsastro exists echo "atsastro exists" else echo "atsastro does not exist"
cd FES;
git pull;


if [ -d "$atsastro" ]; then
    echo "atsastro exists";
    cd $atsastro;
    git pull;
    npm run build;
    cp -pvr dist/* $FES/data/;
else
    echo "atsastro does not exist";
    cd $HOME;
    git clone https://github.com/cjsmocjsmo/atsastro2.2.git;
    cd $atsastro;
    npm install;
    npm run build;
    mkdir $FESD;
    cp -pvr dist/* $FES/data/;
fi

cd $FES;
docker build -t $IMG .;
docker run -d -p 8789:8789 $IMG;
