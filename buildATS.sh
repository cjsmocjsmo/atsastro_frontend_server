#!/bin/sh

atsastro="/media/charliepi/HD/ats/atsastro2.2";
FES="/media/charliepi/HD/ats/atsastro_frontend_server";
VERSION="0.0.1";
IMG="atsastro_frontend_server:$VERSION";

# check if $atsastro exists if $atsastro exists echo "atsastro exists" else echo "atsastro does not exist"

if [ -d "$atsastro" ]; then
    echo "atsastro exists";
    cd $atsastro;
    git pull;
    npm run build;
    cp -pvr dist/* $FES/data/;
else
    echo "atsastro does not exist";
    git clone https://github.com/cjsmocjsmo/atsastro2.2.git;
    cd $atsastro;
    npm run build;
    cp -pvr dist/* $FES/data/;
fi

cd $FES;
# git pull;
# docker build -t $IMG .;
# docker run -d -p 8789:8789 $IMG;
