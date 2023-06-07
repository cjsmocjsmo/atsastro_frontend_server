#!/bin/sh

astastro="/media/charliepi/HD/ats/atsastro2.2";
FES="/media/charliepi/HD/ats/astastro_frontend_server";
VERSION="0.0.1";
IMG="astastro_frontend_server:$VERSION";

# check if $astastro exists if $astastro exists echo "astastro exists" else echo "astastro does not exist"

if [ -d "$astastro" ]; then
    echo "astastro exists";
    cd $astastro;
    git pull;
    npm run build;
    cp -pvr dist/* $FES/data/;
else
    echo "astastro does not exist";
    git clone https://github.com/cjsmocjsmo/astastro2.2.git;
    cd $astastro;
    npm run build;
    cp -pvr dist/* $FES/data/;
fi

cd $FES;
# git pull;
# docker build -t $IMG .;
# docker run -d -p 8789:8789 $IMG;
