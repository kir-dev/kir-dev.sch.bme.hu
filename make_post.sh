#!/bin/bash

# usage: ./make_post.sh '<title>' <author>

DIR=_posts

# checking args
if [ $# != 2 ]; then
    echo 'Error! Usage: ./make_post.sh "<title>" <author>'
    exit -1
fi

# creating variables
filenamedate=`date +"%Y-%m-%d"`
postdate=$filenamedate' '`date +"%H:%M:%S %Z"`
title=$1
escapedtitle=`echo $title | tr '[:upper:]' '[:lower:]' | sed -e 's/á/a/g;s/é/e/g;s/í/i/g;s/ó/o/g;s/ö/o/g;s/ő/o/g;s/ú/u/g;s/ü/u/g;s/ű/u/g;s/ /-/g'`
author=$2
filename=$filenamedate'-'$escapedtitle'.md'
filepath=$DIR/$filename

# creating posttemplate
touch $filepath
echo '---' >> $filepath
echo 'layout: post' >> $filepath
echo 'author: '$author >> $filepath
echo 'date: '$postdate >> $filepath
echo 'title: "'$title'"' >> $filepath
echo 'comment: true' >> $filepath
echo '---' >> $filepath
