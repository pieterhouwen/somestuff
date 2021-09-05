#!/bin/bash


function buildmenu () {
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
N=0
for i in "$@"
do
N=$(expr $N + 1)
echo Option $N is: $i
done
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
}

select builder3 in $(buildmenu user system network)
case $builder3 in
  1)
  echo user  ;;
  2)
  echo system  ;;
  3)
  echo Network ;;
esac
