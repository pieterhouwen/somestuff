#!/bin/bash

##################################
#                                #
# Build a menu building function #
#                                #
##################################

function buildmenu () {
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
N=0
for i in "$@"
do
N=$(expr $N + 1)
echo Option $N is: $i
done
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo
echo Please select your choice:
}

##########################
#                        #
# Define our main menu.  #
#                        #
##########################

function mainmenu () {
while true
	do
		# PS3="Please choose an option "
		# Populate it with options, maybe we should write something to dynamically edit these options.
		buildmenu network system user quit
		read optMain
			case $optMain in
				1)
					networkmenu ;;
				2)
					systemmenu ;;
				3)
					usermenu ;;
				4)
					exit 0
			esac
	done
}


#########################
#                       #
# Define our submenu's. #
#                       #
#########################


function networkmenu () {
# Setup menu options for Network
select optNet in iptables "Back to main menu"
do
	case $optNet in
		iptables)
			iptablesmenu ;;
		"Back to main menu")
			mainmenu ;;
	esac
done
}

function systemmenu () {
while true
	do
	# Setup menu options for System
	buildmenu "View crontab" "Update system" "Start task manager" "Add executable as service" "Back to main menu"
	read optSystem
			case $optSystem in
				"1")
	# Make viewcron.sh do something here
					:
					;;
				"2")
					echo Updating repositories....
					pacman -Syy
					echo Starting full system upgrade....
					pacman -Suy
					;;
				"3")
					htop
					;;
				"4")
					echo Please enter the full path of the executable to be turned into a service.
					read file
					bash $(pwd)/modules/makeservice.sh $file
					;;
				"5")
					mainmenu
					;;
			esac
	done
}

function usermenu () {
while true
	do
		buildmenu "view path" "View homefolder space" "Main menu"
		read optUser
		case $optUser in # Maak eerst een variabel aan voordat je hem probeert uit te lezen -_-
			1)
				echo Your current path is: $PATH ;;
			2)
				echo Your homefolder is $(du -hd 1 ~ | tail -n 1 | cut -f 1) big. ;;
			3)
				break ;;
		esac
	done
}

function iptablesmenu () {
buildmenu "List IPtables chains" "Forward a port on the local system" "Main menu"
	read optIptables
		do
			case $optIptables in
				1)
					echo The current IPtables chains are:
					iptables -L | grep -i chains
					;;
				2)
					echo Please provide external port nr:
					read extport
					echo External port set to $extport.
					echo Please provide internal port nr:
					read intport
					echo Internal port set to $intport
					# echo Please provide internal IP address to forward to:
					# read destIP
					# TODO: actually make it do something.
					# iptables -A INPUT -p any :D :D :D
					;;
				3)
					mainmenu
					;;
			esac
		done
}


mainmenu
