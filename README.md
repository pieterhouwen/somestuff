# somestuff
Some of my personal scripts

# Modules

* AddVirtHost

Adds a virtual host to either nginx or apache2 and optionally secures with SSL.

```
Usage:         /usr/bin/addvirthost -n [NGINX] -a [APACHE] -h [host to add] -d [directory] -s [SSL] -l [port]
 -n             Use NGINX as webserver
 -a             Use APACHE as webserver
 -h             Hostname/domainname to add
 -d             Directory of web files
 -s             Obtain SSL cert using Let's Encrypt
 -l             Use localhost proxy
 ```

* Checkcert

Gives a summary of most commonly checked options, such as:

Expiry date

Bitlenght (strength of certificate)

Just a long list of details

```
Usage: /usr/bin/checkcert: -f [certfile] -s [summary] -e [expiry] -b [bitlength]

-c       Specify your certificate file. This should be a certificate, not a key.
-s       Print a summary of useful details of specified certificate.
-e       Print certificate expiry date.
-b       Print certificate bitlength.
```

* Complete destroy pkg

Completely removes a package from Arch Linux and optionally also its dependencies

* Disk Checker

Monitors available disk space and optionally sends an alert when a threshold is reached

* Makeservice

Creates a service from an executable

* UnPFX

Turns a .pfx file into a .key and .crt

* View Cron

Views cron jobs
