#!/bin/bash
set -e

busybox --install
/usr/lib/frr/frrinit.sh start

if [ -f /network.sh ]; then
    /network.sh
fi

exec busybox sh