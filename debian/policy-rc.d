#!/bin/sh

daemons="cups|cupsys"

if [ "--daemons" = "$1" ]; then
    IFS='|'
    echo $daemons
    exit
fi

case "$2" in
    \(*\))
        exit 101
        ;;
esac

# If nobody's logged in, follow the default policy
if ! [ -e /var/run/athena-login ]; then
    exit 0
elif [ -e /ClusterLogin ]; then
    case "$1" in
        $daemons)
            exit 0
            ;;
        *)
            exit 101
            ;;
    esac
else
    case "$1" in
        $daemons)
            exit 101
            ;;
        *)
            exit 0
            ;;
    esac
fi