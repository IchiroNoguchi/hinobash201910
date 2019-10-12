#!/bin/bash


cd $( dirname $0 )
FILE=cam_hino-bridge_OBS.jpg
BASE=http://www.ktr.mlit.go.jp/keihin/webcam/
curl -R -s -O $BASE/$FILE
if [[ $? -eq 0 ]] ; then
	name=$( date -d @$(  stat -c "%X" $FILE ) --iso-8601=minutes )
	mv $FILE ./cam/$name.jpg
	echo "$( date ) : complate. $name"  > ./cam.log
else
	echo "$( date ) : failed." > ./cam.log
fi

