#!/bin/bash

# This file will completely remove a specified package, and if specified also its dependencies.
# First a root check
if [ $(id -u) -gt 0 ]; then
  echo You have to run this as root!
  exit 1
fi

function checkpackage () {
  if pacman -Q $1 >/dev/null 2>/dev/null; then
    return 0
  else
    return 1
}

if [ -z $1 ]; then
echo Usage: $0 \[ -p \] \<Package name\> - Purge a package and optionally its dependencies.
echo When the -p argument is given this program will delete all deps and config files. Similair to apt-get purge.
exit 1
else
  # Putting a : before the options disables the default error message.
  while getopts ":pd" optPurge
echo
fi
