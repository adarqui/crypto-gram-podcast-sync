#!/bin/sh

#*
#+ Simple script to pull down crypto-gram podcasts.
#*
#- Special thanks to Dan Henage for translating Bruce Schneiers crypto-gram to audio.
#*
#< http://crypto-gram.libsyn.com (http without the s, tehe.)
#< https://www.schneier.com/crypto-gram/
#*
#= FYI: This will fail come year 2105, unless they switch to a 4 digit year.
#*

YEAR_BOTTOM_RANGE=05
YEAR_TOP_RANGE=`date +%y`
SAVE_DIRECTORY=

usage() {
  printf         \
    "$0 <dir>\t: where 'dir' is the directory to sync crypto-gram podcast .mp3's\n"
}

if [ $# -ne 1 ] ; then
  usage && exit 1
fi

SAVE_DIRECTORY="$1"

for i in `seq -f "%02g" ${YEAR_BOTTOM_RANGE} ${YEAR_TOP_RANGE}`; do
  for j in `seq -f "%02g" 1 12`; do
    wget -c -N --directory-prefix="${SAVE_DIRECTORY}" "http://traffic.libsyn.com/dhenage/crypto-gram-$i-$j.mp3"
  done
done
