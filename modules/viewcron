#!/bin/bash
function morethan1 () {
cat /var/spool/cron/$1
# Let's make it pretty
# Sort by day, week or other interval
}

if [ $(id -u) -gt "0" ]; then
echo This program must be run as root!
exit 1
fi

kutzooi="/tmp/kutzooi"

#Usecase var
function helper() {
  echo Usage: $0 \[-u USER \] \| \[-r\]
  echo Display a/multiple users\'s cron job\(s\).
  echo Use the -r switch for root account.
}

# check if arguments exist
if [ -z "$1" ]; then # start if, check if arg = null
  helper
  exit 1
else

# get me self some arguments
  while getopts "ru:" pieter 2>/dev/null; do
         case $pieter in
         u) gg="$OPTARG"
  	;;
         r) gg="root"
  	;;
         *) helper
  	;;
         esac
  done # stop while loop
fi # stop if
 if [ ! -f /var/spool/cron/$gg ]; then
	echo There was an error. Good luck figuring it out.
		exit 1
	fi
  for i in $gg;do
    grep -v \# /var/spool/cron/$i | cut -d " " -f 1 | sed -e 's/\*/\ /g' > $kutzooi/${i}_A1
    grep -v \# /var/spool/cron/$i | cut -d " " -f 2 | sed -e 's/\*/\ /g' > $kutzooi/${i}_A2
    grep -v \# /var/spool/cron/$i | cut -d " " -f 3 | sed -e 's/\*/\ /g' > $kutzooi/${i}_A3
    grep -v \# /var/spool/cron/$i | cut -d " " -f 4 | sed -e 's/\*/\ /g' > $kutzooi/${i}_A4
    grep -v \# /var/spool/cron/$i | cut -d " " -f 5 | sed -e 's/\*/\ /g' > $kutzooi/${i}_A5
    grep -v \# /var/spool/cron/$i | cut -d " " -f 6 | sed -e 's/\*/\ /g' > $kutzooi/${i}_A6
   paste $kutzooi/${i}_A1 $kutzooi/${i}_A2 $kutzooi/${i}_A3 $kutzooi/${i}_A4 $kutzooi/${i}_A5 $kutzooi/${i}_A6 2>/dev/null
  done


for i in 1 2 3 4 5 6; do
   kutzooiarr[${i}]=${gg}_A${i}
done
#print kutzooiarr[]
#echo $(kutzooiarr[*])
#printf '%s\n' "${kutzooiarr[@]}"
echo  ${kutzooiarr[3]}




# ${gg}_A${num}
# Run Command at 13 37 on friday every month
