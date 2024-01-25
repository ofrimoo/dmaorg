#!/bin/bash
# insert link 
echo 'insert Wayback Machine update NUMBER from link, i.e link: "https://web.archive.org/web/20180718155544/dmaorg.info/found/15398642_14/clancy.html" num: 20180718155544'
read archive_num
# downloading with wget
wget --recursive --no-clobber --page-requisites --convert-links --domains web.archive.org --no-parent https://web.archive.org/web/$archive_num/dmaorg.info/found/15398642_14/clancy.html
# verify download 
if [ -d "web.archive.org" ]; then 
  echo 'done!'
else 
  echo 'failed.'
  exit 1 
fi 
# find img directory
if file web.archive.org/web/"$archive_num"im_/http:/dmaorg.info/found/15398642_14/img; then
  echo 'found img directory!'
  mv web.archive.org/web/"$archive_num"im_/http:/dmaorg.info/found/15398642_14/img .
  echo 'img directory was moved..'
  echo 'deleting unnecessary files...'
  rm -rf web.archive.org
  echo 'done!'
  exit 1
else 
  echo 'failed'
  exit 1
fi 

