#!/bin/bash


PROLOG="<html><head><link type='text/css' rel='stylesheet' href='imgs.css' title='CSS stylesheet' /></head><body>"

TRAIL="</body></html>"


cd /vagrant/citedownmgr
gradle -Pconf=/vagrant/hc-iliad24/configs/cdmgr.conf flatmd


cd /vagrant/hc-iliad24/converted

shopt -s nullglob
for f in *.md
do
    extension="${f##*.}"
    filename="${f%.*}"
    pandoc -o tmp.html ${f}
    HTML=`cat tmp.html`
    echo $PROLOG $HTML $TRAIL > ${filename}.html
    /bin/rm tmp.html
    #echo "Process ${f}, ${filename}, ${extension}"
done


Status API Training Shop Blog About Pricing
