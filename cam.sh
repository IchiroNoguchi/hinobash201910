#!/bin/bash

export TZ=JST-9


execgit(){
	git add -A ./cam/

	git commit -m "$0: $( date )" 
	git push  origin master
}

genmv(){
  	dir=$1
	convert -delay 50 ./cam/$dir/*.jpg  ./cam/mov/$dir.gif
}

cd $( dirname $0 )
FILE=cam_hino-bridge_OBS.jpg
BASE=http://www.ktr.mlit.go.jp/keihin/webcam/


code=$(  curl -R -s -O $BASE/$FILE -w '%{http_code}\n' -s  )
if [[ $code = "200" ]] ; then
	name=$( date -d @$(  stat -c "%X" $FILE ) --iso-8601=minutes )
	dir=${name:0:10}
        mkdir ./cam/$dir
	mv $FILE ./cam/$dir/$name.jpg
	## genmv $dir
	echo "$( date ) : complate. $name"  > ./cam.log

	execgit

else
	echo "$( date ) : failed." > ./cam.log
fi


