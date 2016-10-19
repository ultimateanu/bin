#!/bin/bash

URL=$1
PLAIN="$(curl $URL --silent --write-out "%{size_download}\n" --output /dev/null)"
GZIPPED="$(curl $URL --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null)"
RATIO=$(bc <<< "scale=1;100*$GZIPPED/$PLAIN") 

echo "Plain : $PLAIN"
echo "Gzip  : $GZIPPED"
echo "Ratio : $RATIO%"
