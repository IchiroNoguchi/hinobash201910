#!/bin/bash


cd $( dirname $0 )

git add -A ./cam/

git commit -m "$0: $( date )" 
git push  origin master
