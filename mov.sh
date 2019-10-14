#!/bin/bash

export TZ=JST-9


execgit(){
	git add -A ./cam/ 

	git commit -m "$0: $( date )" 
	git push  origin master
}

genmv(){
  	dir=$1
	convert -delay 10 ./cam/$dir/*.jpg  ./cam/mov/$dir.gif
}

cd $( dirname $0 )
dir=$( date --iso-8601 )
mkdir ./cam/$dir
genmv $dir
execgit 
echo "$( date ) : complate. $name"  > ./cam.log

