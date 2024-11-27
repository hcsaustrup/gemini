#!/usr/bin/env bash

set -eu


for X in $(find -mindepth 1 -maxdepth 1 -type d)
do
  echo $X
  echo "# $X" > $X/README.md

  export X


  ls $X/*.jpg | grep -v scaled |
  while read IMG
  do
    echo "IMG: $IMG"
    IMG=$(basename $IMG .jpg)

    cat >> $X/README.md <<EOF
![$IMG](${IMG}-scaled.jpg "$IMG") </br> ([Full size](${IMG}.jpg))

EOF
  done
done

