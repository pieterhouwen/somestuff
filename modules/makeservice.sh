#!/bin/bash
if [ $(id -u) -gt "0" ]; then
echo This program must be run as root!
exit 1
fi

#Usecase var
function helper() {
echo Usage: $0 \[ /path/to/executable \]
echo Create a service out of an executable.
}

if [ -z "$1" ]; then # If no arguments are given, stop with exit code 1, else resume normal operation.
helper
exit 1
else 
if [ -x $1 ]; then
    echo Give me a Description
    read servicedesc
    echo Great, now give me some args (leave blank for none)
    read args
    cat << EOF >/tmp/service.service
[Unit]
Description=$servicedesc
After=network.target

[Service]
ExecStart=$1 $args
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target

EOF
    echo Service file has been written to /tmp/service.service
    echo What would you like to name it (for use with systemctl)?
    read servicename
    mv /tmp/service.service /usr/lib/systemd/system/$servicename
    echo Enable at boot time? Y/N
    read enableboot
    if [ $enableboot == "Y" ] || [ $enableboot == "y" ]; then
    systemctl enable $servicename
  else
    systemctl start $servicename
  else
    echo $1 does not exist or is not executable!
    exit 1
  fi
